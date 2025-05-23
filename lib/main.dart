import 'package:flutter/material.dart';
import 'dart:math';

import 'package:quizzer/alertstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatefulWidget {
  Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  String s = 'HIT TRUE TO START';
  int a = 0;

  List<String> string = [
    'You’ve stalked your crush’s Instagram and accidentally liked an old picture.',
    'You’ve texted “I’m on my way” while still in bed.',
    'You’ve saved someone’s number as "Don’t Answer" or “Weird Guy.',
    'You’ve spent more time choosing a filter for your selfie than taking the picture.',
    'You’ve lied to a friend about being busy just because you didn’t want to hang out.',
    'You’ve sent “haha” but didn’t even smile.',
    'You’ve looked at your ex’s profile and regretted it immediately.',
    'You’ve practiced a breakup speech in the mirror.',
    'You’ve taken over 50 selfies but didn’t post even one.',
    'You’ve Googled "How to know if they like you back?',
    'You’ve flirted with someone and later realized they were taken.',
    'You’ve sent a risky text and then immediately turned off your phone.',
    'You’ve played a love song and imagined yourself in a movie scene.',
    'You’ve kept a secret crush on someone in the same group.',
    'You’ve lied about your relationship status to avoid awkward conversations.',
    'You’ve deleted a message after sending it, hoping they didn’t read it.',
    ' You’ve checked your reflection on your phone screen before walking past your crush.',
    'You’ve acted extra nice to someone just to get something from them.'
  ];

  List<Icon> icons = [];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 100,
          backgroundColor: Colors.grey.shade900,
          title: Center(
            child: Text(
              'QUIZ APP - by keshav',
              style: TextStyle(color: Colors.white, fontFamily: 'Bangers'),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 8,
                child: Card(
                  color: Colors.grey.shade900,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '" $s "',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Bangers'),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      a++;
                      if (a == 11) {







                      } else if (a < 11) {
                        var n = Random().nextInt(string.length);

                        s = string[n];
                      }

                      if (a > 1) {
                        var q = Random().nextInt(2);
                        if (q == 0) {
                          icons.add(Icon(
                            Icons.check_outlined,
                            color: Colors.greenAccent,
                            size: 25,
                          ));
                        } else if (q == 1) {
                          icons.add(Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 25,
                          ));
                        }
                      }
                      if (a == 12) {
                        icons.clear();
                        a = 1;
                        var n = Random().nextInt(string.length);
                        s = string[n];
                      }
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    color: Colors.green.shade400,
                    child: Center(
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bangers',
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      a++;
                      if (a == 11) {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "RFLUTTER ALERT",
                          desc: "Flutter is more awesome with RFlutter Alert.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "COOL",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                              radius: BorderRadius.circular(0.0),
                            ),
                          ],
                        ).show();
                      } else if (a < 11) {
                        var n = Random().nextInt(string.length);

                        s = string[n];
                      }

                      if (a > 1) {
                        var q = Random().nextInt(2);
                        if (q == 0) {
                          icons.add(Icon(
                            Icons.check_outlined,
                            color: Colors.greenAccent,
                            size: 25,
                          ));
                        } else if (q == 1) {
                          icons.add(Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 25,
                          ));
                        }
                      }
                      if (a == 12) {
                        icons.clear();
                        a = 1;
                        var n = Random().nextInt(string.length);
                        s = string[n];
                      }
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                    color: Colors.red.shade300,
                    child: Center(
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bangers',
                            color: Colors.red.shade900),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.grey.shade800,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'SCORE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Bangers'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: icons,
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}




void keshav(BuildContext context){
  alert(
  )




}