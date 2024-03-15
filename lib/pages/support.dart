import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
        title: Text('Support'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'lib/images/help-desk.png',
                width: 150,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              '''Hello, How Can We Help You?''',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
