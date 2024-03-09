// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String fullname;
  final String email;
  final String mobile;
  final String token;
  final List<Ticket> tickets;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.mobile,
    required this.token,
    required this.tickets,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'email': email,
      'mobile': mobile,
      'token': token,
      'tickets': tickets.map((ticket) => ticket.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    List<Ticket> tickets = [];
    if (map['user']['Tickets'] != null) {
      tickets = List<Ticket>.from(map['user']['Tickets'].map((ticket) => Ticket.fromMap(ticket)));
    }

    return User(
      id: map['user']['id'].toString(),
      fullname: map['user']['fullname'] as String,
      email: map['user']['email'] as String,
      mobile: map['user']['mobile'] as String,
      token: map['token'] as String,
      tickets: tickets,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Ticket {
  final int id;
  final String ticketType;
  final String subject;
  final String priority;
  final String country;
  final String policeOfficerName;
  final String VIN;
  final String date;
  final String imageUrl;
  final String ticketStatus;
  final int ticketId;
  final String submittedDate;
  final String createdAt;
  final String updatedAt;
  final int userId;

  Ticket({
    required this.id,
    required this.ticketType,
    required this.subject,
    required this.priority,
    required this.country,
    required this.policeOfficerName,
    required this.VIN,
    required this.date,
    required this.imageUrl,
    required this.ticketStatus,
    required this.ticketId,
    required this.submittedDate,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ticketType': ticketType,
      'subject': subject,
      'priority': priority,
      'country': country,
      'policeOfficerName': policeOfficerName,
      'VIN': VIN,
      'date': date,
      'imageUrl': imageUrl,
      'ticketStatus': ticketStatus,
      'ticketId': ticketId,
      'submittedDate': submittedDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as int,
      ticketType: map['ticketType'] as String,
      subject: map['subject'] as String,
      priority: map['priority'] as String,
      country: map['country'] as String,
      policeOfficerName: map['policeOfficerName'] as String,
      VIN: map['VIN'] as String,
      date: map['date'] as String,
      imageUrl: map['imageUrl'] as String,
      ticketStatus: map['ticketStatus'] as String,
      ticketId: map['ticketId'] as int,
      submittedDate: map['submittedDate'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      userId: map['userId'] as int,
    );
  }
}
