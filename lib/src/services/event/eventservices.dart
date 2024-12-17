import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:flutter/cupertino.dart';

class EventService extends ChangeNotifier{
  final CollectionReference _reference = FirebaseFirestore.instance.collection("events");

  Future<List<EventModel>> getEvents()async{
    try{
      final tasks = await _reference.get().then((snapshot){
        return snapshot.docs.map((doc){
          return EventModel.fromJson(doc.data() as Map<String,dynamic>);
        }).toList();
      });
      return tasks;
    }catch(error) {
      print("Error : $error");
      return [];
    }
  }

  Future<EventModel> getEventsById(String id)async{
    return await _reference.doc(id).get().then((snapshot){
      return EventModel.fromJson(snapshot.data() as Map<String,dynamic>);
    });
  }

  Future<List<EventModel>> getEventsByUserId(String id)async{
    final events = await _reference.where('userId',isEqualTo: id).get().then((snapshot){
      return snapshot.docs.map((doc){
        return EventModel.fromJson(doc.data() as Map<String,dynamic>);
      }).toList();
    });
    return events;
  }
}