import 'package:arrhythmia/screens/types_screen.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class ClassifyScreen extends StatefulWidget {
  static const routName = '/classify-screen';
  final int index;
  const ClassifyScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ClassifyScreen> createState() => _ClassifyScreenState();
}

class _ClassifyScreenState extends State<ClassifyScreen> {
  List<String> types = [
    'Normal Beats',
    'Supraventricular premature Beats',
    'Premature ventricular contraction',
    'Fusion of ventricular and normal Beats',
    'Unclassifiable Beats',
  ];
  @override
  void initState() {
    super.initState();
    //asyncInit();
  }

  asyncInit() async {
    if (widget.index != 0 && widget.index != 4) {
      final Telephony telephony = Telephony.instance;
      bool? permissionsGranted = await telephony.requestSmsPermissions;

      if (permissionsGranted == true) {
        try {
          telephony.sendSms(
            to: '03014815847',
            message:
                "Detected ${types[widget.index]} in patient. Need your help!",
            // statusListener: (status) {
            //   switch (status) {
            //     case SendStatus.SENT:
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text('Message Sent successfully'),
            //         backgroundColor: Colors.green,
            //       ));
            //       break;
            //     case SendStatus.DELIVERED:
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text('Message Delivered successfully'),
            //         backgroundColor: Colors.green,
            //       ));
            //       break;
            //     default:
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Failed to send message'),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //   }
            // },
          );
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classify'),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              asyncInit();

              return InkWell(
                onTap: () {
                  i == widget.index
                      ? Navigator.of(context).pushNamed(TypesScreen.routName)
                      : null;
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: i == widget.index ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      types[i],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
