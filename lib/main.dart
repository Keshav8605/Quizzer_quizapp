import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String s = 'HIT TRUE TO START';
  int a = 0;
  int score = 0;
  bool quizFinished = false;
  List<dynamic> users = [];
  List<Widget> icons = [];

  @override
  void initState() {
    super.initState();
    functioncall();
  }

  void functioncall() async {
    const url = 'https://opentdb.com/api.php?amount=10&type=boolean';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        users = json['results'];
        if (users.isNotEmpty) {
          s = users[0]['question'];
          a = 0;
          score = 0;
          icons.clear();
          quizFinished = false;
        }
      });
    } else {
      print('Failed to load data');
    }
  }

  void checkAnswer(String userAnswer) {
    if (users.isEmpty || quizFinished) return;

    String correctAnswer = users[a]['correct_answer'];

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
        icons.add(
            Icon(Icons.check_outlined, color: Colors.greenAccent, size: 25));
      } else {
        icons.add(Icon(Icons.close, color: Colors.red, size: 25));
      }
    });
  }

  void nextQuestion() {
    if (a < 9) {
      setState(() {
        a++;
        s = users[a]['question'];
      });
    } else {
      setState(() {
        quizFinished = true;
        s = 'Thank you for playing!\nPress TRUE to restart.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.grey.shade900,
          title: Center(
            child: Text(
              'QUIZ APP - by Keshav',
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
                      s,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Bangers',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: users.isEmpty
                    ? null
                    : () {
                        if (quizFinished) {
                          setState(() {
                            score = 0;
                            a = 0;
                            icons.clear();
                            users = [];
                            s = 'HIT TRUE TO START';
                            quizFinished = false;
                          });
                          functioncall();
                        } else {
                          checkAnswer("True");
                          nextQuestion();
                        }
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
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: (users.isEmpty || quizFinished)
                    ? null
                    : () {
                        checkAnswer("False");
                        nextQuestion();
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
                        color: Colors.red.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                        'SCORE: $score',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Bangers',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: icons,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
