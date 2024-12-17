import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/usermodel.dart';
import '../auth/authservices.dart';

class UserService{
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(UserModel user,String password) async {
    try {
      final userCredential = await AuthService().createUserWithEmailAndPassword(
          email: user.email, password: password);

      final userId = userCredential!.user?.uid;

      if (userId != null) {
        final userRef = _usersCollection.doc(userId);
        final userMap = user.toJson();
        userMap['userId'] = userId;
        await userRef.set(userMap);
      }
    } catch (error) {
      print('Error : $error');
    }
  }

  Future<UserModel> getUserById(String id)async{
    return await _usersCollection.doc(id).get().then((snapshot){
      return UserModel.fromJson(snapshot.data() as Map<String,dynamic>);
    });
  }
}