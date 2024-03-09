import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/pages/changePassword.dart';
import 'package:trafficticket_management/pages/success.dart';
import 'package:trafficticket_management/providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class UserDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return DrawerHeader(
      // ignore: unnecessary_null_comparison
      child: user != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: const Icon(
                    Icons.waving_hand_rounded,
                    color: Colors.amber,
                    size: 48,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.fullname,
                  style: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_sharp,
              color: Color.fromARGB(255, 4, 25, 145),
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuccessProfile(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 4, 25, 145),
              size: 32,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 4, 25, 145),
        child: Column(
          children: [
            UserDrawerHeader(),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assistant),
              title: Text('Support'),
              onTap: () {},
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text('Terms & Conditions'),
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete_sharp),
              title: Text('Delete Acount'),
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              iconColor: const Color.fromARGB(153, 255, 255, 255),
              textColor: const Color.fromARGB(153, 255, 255, 255),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.waving_hand,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      user.fullname,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
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
