import 'package:flutter/material.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/pages/homePage.dart';

class SuccessProfile extends StatelessWidget {
  const SuccessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('lib/images/mark.png'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Column(
            children: [
              Text(
                'Success !',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Text('''Your profile updated successfully.'''),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                text: 'Done'),
          ),
        ],
      ),
    );
  }
}
