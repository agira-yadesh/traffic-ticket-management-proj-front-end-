// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'package:trafficticket_management/services/auth_services.dart';

class EditProfile extends StatelessWidget {
  final Map<String, dynamic> userData;
  EditProfile({super.key, required this.userData});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final email = userData['user']['email'];
    final phone = userData['user']['phone'];
    final fax = userData['user']['fax'];
    final fullname = userData['user']['fullName'];

    final mobile = userData['user']['mobile'];
    String? dobString = userData['user']['dob'];
    String formattedDob = dobString != null
        ? DateFormat('yyyy-MM-dd').format(DateTime.parse(dobString))
        : '-';

    final dl = userData['user']['dl'];
    final company = userData['user']['company'];

    final user = Provider.of<UserProvider>(context).user;
    String fullName = user.fullname;

    // final user = Provider.of<UserProvider>(context).user;
    // String fullName = user.fullname;
    final nameController = TextEditingController(text: fullname);
    // String email = user.email;
    final emailController = TextEditingController(text: email);
    // String mobile = user.mobile;
    final mobileController = TextEditingController(text: mobile);
    // String? phone = user.phone;
    final phoneController = TextEditingController(text: phone);
    // String? fax = user.contackFax;
    final faxController = TextEditingController(text: fax);
    // String? dob = user.DOB;
    final dobController = TextEditingController(text: formattedDob);
    // String? dl = user.drivingLicense;
    final dlController = TextEditingController(text: dl);
    // String? company = user.company;
    final companyController = TextEditingController(text: company);

    List<String> words = fullName.split(' ');
    String profile = words[0][0] + words[1][0];

    void editProfile(BuildContext context) {
      authService.editProfile(
          context: context,
          DOB: dobController.text,
          DL: dlController.text,
          company: companyController.text,
          phone: phoneController.text,
          fax: faxController.text);
    }

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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 100,
                          height: 100,
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
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyTextField(
                controller: nameController,
                hintText: '',
                obscureText: false,
                enabled: false,
                label: 'Full Name',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: emailController,
                hintText: '',
                obscureText: false,
                enabled: false,
                label: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: mobileController,
                hintText: '',
                obscureText: false,
                enabled: false,
                label: 'Mobile',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: phoneController,
                hintText: 'phone',
                obscureText: false,
                enabled: true,
                label: 'Phone',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: faxController,
                hintText: 'Fax',
                obscureText: false,
                enabled: true,
                label: 'Fax',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: dobController,
                hintText: 'YYYY-MM-DD',
                obscureText: false,
                enabled: true,
                label: 'Date Of Birth',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: dlController,
                hintText: 'Driving License',
                obscureText: false,
                enabled: true,
                label: 'Driving License',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: companyController,
                hintText: 'Company Name',
                obscureText: false,
                enabled: true,
                label: 'Company',
              ),
              const SizedBox(
                height: 20,
              ),
              Positioned(
                bottom: 30,
                child:
                    MyButton(onTap: () => editProfile(context), text: "Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
