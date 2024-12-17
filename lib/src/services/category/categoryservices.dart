import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/src/models/categorymodel.dart';

class CategoryService{
  final CollectionReference _reference = FirebaseFirestore.instance.collection("category");

  Future<List<CategoryModel>> getCategories()async{
    try{
      final tasks = await _reference.get().then((snapshot){
        return snapshot.docs.map((doc){
          return CategoryModel.fromJson(doc.data() as Map<String,dynamic>);
        }).toList();
      });
      return tasks;
    }catch(error) {
      print("Error : $error");
      return [];
    }
  }

  Future<CategoryModel> getCategoryById(String id)async{
    return await _reference.doc(id).get().then((snapshot){
      return CategoryModel.fromJson(snapshot.data() as Map<String,dynamic>);
    });
  }

}