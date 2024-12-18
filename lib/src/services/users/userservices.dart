import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> googleSaveUser()async{
    try{
      final UserCredential? _userCredential = await AuthService().signInWithGoogle();
      final User? user = _userCredential?.user;

      if(user != null){
        final UserModel newUser = UserModel(
            userid: user.uid, name: user.displayName ?? "No Name", email: user.email ?? "No Email");

        final docRef = _usersCollection.doc(user.uid);
        await docRef.set(newUser.toJson());}
    }catch(error){
      print('Error creating user: $error');
    }
  }
}