import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel{
  final String eventId;
  final String title;
  final String description;
  final DateTime date;
  final DateTime endTime;
  final String venue;
  final String address;
  final String userId;
  final int price;
  final int tickets;
  final DateTime createdAt;
  final List category;

  EventModel({
    required this.eventId,
    required this.title,
    required this.description,
    required this.date,
    required this.endTime,
    required this.venue,
    required this.address,
    required this.userId,
    required this.price,
    required this.tickets,
    required this.createdAt,
    required this.category
  });

  factory EventModel.fromJson(Map<String,dynamic> json){
    return EventModel(
        eventId: json["eventId"],
        title: json["title"],
        description: json["description"],
        date: (json['date'] as Timestamp).toDate(),
        venue: json["venue"],
        address: json["address"],
        userId: json["userId"],
        price: json["price"],
        tickets: json["tickets"],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        category: List<String>.from(json['category']),
        endTime: (json['endTime'] as Timestamp).toDate());
  }

}