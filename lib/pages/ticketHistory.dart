import 'package:flutter/material.dart';

class TicketHistory extends StatelessWidget {
  final List<dynamic> userTickets;
  const TicketHistory({super.key, required this.userTickets});

  @override
  Widget build(BuildContext context) {
    print('$userTickets hi');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
        title: Text('Ticket History'),
      ),
      body: ListView.builder(
          itemCount: userTickets.length,
          itemBuilder: (BuildContext context, int index) {
            final ticket = userTickets[index];
            return GestureDetector(
              onTap: () {
                print('from button');
              },
              child: Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            '''#${ticket['ticketId']} - ${ticket['ticketType']}  ''',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 29, 111, 253),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                '${ticket['ticketStatus']}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Text('Ticket Date: ${ticket['date']}')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
    );
  }
}
