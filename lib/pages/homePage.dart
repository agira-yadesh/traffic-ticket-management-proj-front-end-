import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/pages/changePassword.dart';
import 'package:trafficticket_management/pages/success.dart';
import 'package:trafficticket_management/pages/terms.dart';
import 'package:trafficticket_management/pages/viewProfile.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'package:trafficticket_management/services/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class UserDrawerHeader extends StatelessWidget {
  const UserDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return DrawerHeader(
      // ignore: unnecessary_null_comparison
      child: user != null
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Icon(
                    Icons.waving_hand_rounded,
                    color: Colors.amber,
                    size: 48,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.fullname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          : const Text(
              'Loading...'), // Show a loading message or handle accordingly
    );
  }
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = AuthService();

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  void userProfile(BuildContext context) {
    print('hi');
    authService.viewProfile(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 40,
                color: Color.fromARGB(255, 4, 25, 145),
              ),
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_sharp,
                color: Color.fromARGB(255, 4, 25, 145),
                size: 32,
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      drawer: Drawer(
        width: 320,
        backgroundColor: const Color.fromARGB(255, 4, 25, 145),
        child: Column(
          children: [
            const UserDrawerHeader(),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'H o m e',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text(
                'P r o f i l e',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                userProfile(context);
              },
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text(
                'H i s t o r y',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(
                'C h a n g e  P a s s w o r d',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text(
                'S u p p o r t',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              onTap: () {},
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text(
                'T e r m s  &  C o n d i t i o n s',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Terms()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.delete_sharp),
              title: const Text(
                'D e l e t e  A c o u n t',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'L o g o u t',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              iconColor: const Color.fromARGB(206, 255, 255, 255),
              textColor: const Color.fromARGB(206, 255, 255, 255),
              onTap: () => signOutUser(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Opacity(
                        opacity: 0.9,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.srcOver,
                          ),
                          child: Image.asset(
                            'lib/images/img5.jpg',
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 60,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Simplify Your Legal Fight With\nNew York's Top Attorneys",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 10,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 0, 217, 255),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(150, 60),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll((8.0)),
                        ),
                        child: const Text(
                          'Create New Ticket',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 180,
                      left: 10,
                      child: Column(
                        children: [
                          Text(
                            'Let us be your judicial guide',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Add the rest of your content below the Dashboard text
            ],
          ),
        ),
      ),
    );
  }
}
