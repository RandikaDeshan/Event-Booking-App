import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:flutter/cupertino.dart';

class FilterService extends ChangeNotifier{
  final CollectionReference _reference = FirebaseFirestore.instance.collection("events");
  List<EventModel> allEvents = [];
  List<EventModel> filterEventsCategory = [];
  List<EventModel> filterEventsDate = [];
  List<EventModel> filterEventsLocation = [];
  List<EventModel> filterEventsPrice = [];
  List<EventModel> filteredEvents = [];

  List<String> _categories = [];


  Future<void> setCategories(List<String> categoriesList) async{
    _categories = categoriesList;
    print(_categories);
  }

  set categories(List<String> categoryList){
    _categories = categoryList;
    print(_categories);
  }

  List<String> get categories{
    return _categories;
  }

  Future<List<EventModel>> getEvents()async{
    try{
      allEvents = await _reference.get().then((snapshot){
        return snapshot.docs.map((doc){
          return EventModel.fromJson(doc.data() as Map<String,dynamic>);
        }).toList();
      });
      print(allEvents);
      return allEvents;
    }catch(error) {
      print("Error : $error");
      return [];
    }
  }

  Future<List<EventModel>> filterEventsByCategory(List<String>? category,DateTime? date) async{
    try{
      if(category != null){
      filterEventsCategory = await _reference.where('category',arrayContainsAny: category.toList()).get().then((snapshot){
        return snapshot.docs.map((doc){
          return EventModel.fromJson(doc.data() as Map<String,dynamic>);
        }).toList();
      });
      }
      if(date != null){
        filterEventsDate = await _reference.where("date",isEqualTo: date).get().then((snapshot) {
          return snapshot.docs.map((doc){
            return EventModel.fromJson(doc.data() as Map<String,dynamic>);
          }).toList();
        },);
      }
      List<EventModel> allEventsNew = filterEventsCategory.toSet().intersection(filterEventsDate.toSet()).toList();
      print(allEventsNew);
      return filterEventsCategory;
    }catch(error){
      print("Error : $error");
      return [];
    }
  }


  Future<List<EventModel>> filterEvents(List<String>? categories, DateTime? date, int? price1, int? price2,String? location)async{
    try{
      // filteredEvents = allEvents.where((event) {
      //   final selectedCategories = categories.isEmpty || categories.any((element) => event.category.contains(element),);
      //   final selectedDate = date == null || event.date == date;
      //   return selectedDate && selectedCategories;
      // },).toList();
      if(categories != null) {
        allEvents =
            allEvents.where((event) => event.category.contains(categories.toList()),)
                .toList();
      }
      if(date != null){
        allEvents = allEvents.where((event) => categories!.any((category)=>event.category.contains(category))).toList();
      }
      if(location != null){
        allEvents = allEvents.where((event) => event.venue == location,).toList();
      }
      if(price1 != null && price2 != null){
        allEvents = allEvents.where((event) => event.price <= price2 && event.price >= price1,).toList();
      }
      notifyListeners();
      print("Filtered Events: ${allEvents.map((e) => e.title).toList()}");
      return allEvents;

    }catch(error){
      print("Error : $error");
      return [];
    }
  }

}