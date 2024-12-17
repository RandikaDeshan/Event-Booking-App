import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/src/models/reviewmodel.dart';

class ReviewService{
  final CollectionReference _reference = FirebaseFirestore.instance.collection("reviews");

  Future<List<ReviewModel>> getReviews()async{
    try{
      final tasks = await _reference.get().then((snapshot){
        return snapshot.docs.map((doc){
          return ReviewModel.fromJson(doc.data() as Map<String,dynamic>);
        }).toList();
      });
      return tasks;
    }catch(error) {
      print("Error : $error");
      return [];
    }
  }

  Future<List<ReviewModel>> getReviewsByEventId(String id)async{
    final events = await _reference.where('eventId',isEqualTo: id).get().then((snapshot){
      return snapshot.docs.map((doc){
        return ReviewModel.fromJson(doc.data() as Map<String,dynamic>);
      }).toList();
    });
    return events;
  }

  Future<ReviewModel> getReviewsById(String id)async{
    return await _reference.doc(id).get().then((snapshot){
      return ReviewModel.fromJson(snapshot.data() as Map<String,dynamic>);
    });
  }
}