import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/pages/editProfile.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'package:intl/intl.dart';

class ViewProfile extends StatelessWidget {
  final Map<String, dynamic> userData;
  const ViewProfile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final email = userData['user']['email'];
    final phone = userData['user']['phone'];
    final fax = userData['user']['fax'];
    final fullname = userData['user']['fullName'];

    final mobile = userData['user']['mobile'];
    String? dobString = userData['user']['dob'];
    String formattedDob = dobString != null
        ? DateFormat('MMM dd, yyyy').format(DateTime.parse(dobString))
        : '-';

    final dl = userData['user']['dl'];
    final company = userData['user']['company'];
    final user = Provider.of<UserProvider>(context).user;
    String fullName = user.fullname;

    List<String> words = fullName.split(' ');
    String profile = words[0][0] + words[1][0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 4, 25, 145),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          profile.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color.fromARGB(207, 255, 255, 255)),
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            fullname,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Email',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            email,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Mobile',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            mobile,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Phone',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            phone ?? '-',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Fax',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            fax ?? '-',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Date of birth',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            formattedDob ?? '-',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Driving License',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            dl ?? '-',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        children: [
                          Text(
                            'Company',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            company ?? '-',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(userData: userData),
                      ),
                    );
                  },
                  text: 'Edit'),
            ],
          ),
        ),
      ),
    );
  }
}
