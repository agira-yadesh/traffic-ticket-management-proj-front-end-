import 'package:flutter/material.dart';

class CreateTicket extends StatelessWidget {
  const CreateTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
        title: const Text('Create Ticket'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(child: Column()),
    );
  }
}
