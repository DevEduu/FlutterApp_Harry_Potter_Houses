import 'package:flutter/material.dart';
import 'package:herryschool/helper.dart';

Helper helper = Helper();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00282b30),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/harrypotter.jpg'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Expanded(
              flex: 12,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Text(
                    helper.getQuestion(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                ),
                onPressed: () {
                  setState(() {
                    helper.nextQuestion(1);
                  });
                },
                // ignore: prefer_const_constructors
                child: Text(
                  helper.getChoice1(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: helper.buttonShouldBeVisible(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                  ),
                  onPressed: () {
                    setState(() {
                      helper.nextQuestion(2);
                    });
                  },
                  // ignore: prefer_const_constructors
                  child: Text(
                    helper.getChoice2(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
