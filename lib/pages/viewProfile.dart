import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/pages/editProfile.dart';
import 'package:trafficticket_management/providers/user_provider.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    String fullName = user.fullname;

    List<String> words = fullName.split(' ');
    String profile = words[0][0] + words[1][0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
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
                            user.fullname,
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
                            user.email,
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
                            user.mobile,
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
                            user.phone ?? '-',
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
                            user.contackFax ?? '-',
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
                            user.DOB ?? '-',
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
                            user.drivingLicense ?? '-',
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
                            user.company ?? '-',
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
                        builder: (context) => EditProfile(),
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
