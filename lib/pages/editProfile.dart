import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/success.dart';
import 'package:trafficticket_management/providers/user_provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    String fullName = user.fullname;
    final nameController = TextEditingController(text: fullName);
    String email = user.email;
    final emailController = TextEditingController(text: email);
    String mobile = user.mobile;
    final mobileController = TextEditingController(text: mobile);
    String? phone = user.phone;
    final phoneController = TextEditingController(text: phone);
    String? fax = user.contackFax;
    final faxController = TextEditingController(text: fax);
    String? dob = user.DOB;
    final dobController = TextEditingController(text: dob);
    String? dl = user.drivingLicense;
    final dlController = TextEditingController(text: dl);
    String? company = user.company;
    final companyController = TextEditingController(text: company);

    List<String> words = fullName.split(' ');
    String profile = words[0][0] + words[1][0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 120,
                        height: 120,
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
              MyTextField(
                controller: nameController,
                hintText: '',
                obscureText: false,
                enabled: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: '',
                  obscureText: false,
                  enabled: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: mobileController,
                  hintText: '',
                  obscureText: false,
                  enabled: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: phoneController,
                  hintText: 'phone',
                  obscureText: false,
                  enabled: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: faxController,
                  hintText: 'Fax',
                  obscureText: false,
                  enabled: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: dobController,
                  hintText: 'Date of Birth',
                  obscureText: false,
                  enabled: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: dlController,
                  hintText: 'Driving License',
                  obscureText: false,
                  enabled: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: companyController,
                  hintText: 'Company Name',
                  obscureText: false,
                  enabled: true),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessProfile()));
                  },
                  text: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}
