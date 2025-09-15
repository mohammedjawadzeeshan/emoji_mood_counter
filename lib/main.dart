import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: EmojiMoodCounter(),
    );
  }
}

class EmojiMoodCounter extends StatefulWidget {
  const EmojiMoodCounter({super.key});

  @override
  State<EmojiMoodCounter> createState() => _EmojiMoodCounterState();
}

class _EmojiMoodCounterState extends State<EmojiMoodCounter> {
  int counter = 0;

  // Return emoji based on counter value
  String getMoodEmoji(int count) {
    if (count < 1) {
      return "😐"; // neutral
    } else if (count < 2) {
      return "🙂"; // slight smile
    } else if (count < 3) {
      return "😄"; // happy
    } else {
      return "🤩"; // excited
    }
  }

  void incrementCounter() {
    setState(() {
      counter = (counter + 1) % 4; // cycle counter 0-7 repeatedly
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Mood Counter'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getMoodEmoji(counter), style: TextStyle(fontSize: 200)),
            GestureDetector(
              onTap: incrementCounter,
              child: Text(
                "Tap to change emoji",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
