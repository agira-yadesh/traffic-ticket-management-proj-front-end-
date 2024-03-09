import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/pages/success.dart';
import 'package:trafficticket_management/providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        'lib/images/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
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
                                  builder: (context) => const SuccessProfile()),
                            );
                          },
                          icon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 4, 25, 145),
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                            color: Colors.black54),
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
                              Colors.black.withOpacity(
                                  0.5), // Adjust the opacity (0.0 to 1.0)
                              BlendMode.srcOver,
                            ),
                            child: Image.asset(
                              'lib/images/img5.jpg',
                              width:
                                  double.infinity, // Full width of the screen
                              height: 220, // Adjust the height as needed
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
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              elevation: const MaterialStatePropertyAll((8.0))),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Dashboard',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
