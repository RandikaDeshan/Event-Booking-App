import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel{
  final String id;
  final String userId;
  final String eventId;
  final String name;
  final String image;
  final String description;
  final int rate;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.description,
    required this.rate,
    required this.name,
    required this.image,
    required this.userId,
    required this.createdAt,
    required this.eventId
  });

  factory ReviewModel.fromJson(Map<String,dynamic> json){
    return ReviewModel(
        id: json['id'],
        description: json['description'],
        rate: json['rate'],
        userId: json['userId'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        eventId: json['eventId'],
        name: json['name'],
        image: json['image']
    );
  }
}