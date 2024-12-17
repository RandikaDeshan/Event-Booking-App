import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> createUserWithEmailAndPassword({required String email, required String password})async{
    try{
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    }catch(error){
      print("Error : $error");
      return null;
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print('Error : $error');
    }
  }

  Future<void> signOut() async{
    try {
      await _auth.signOut();
    } catch (error) {
      print('Error : $error');
    }
  }

  Future<void> sendOtp({required String email})async{
    try {
      EmailOTP.config(
          otpType: OTPType.numeric,
          otpLength: 4,
          emailTheme: EmailTheme.v3
      );
      EmailOTP.sendOTP(email: email);
    }catch(error){
      print("Error : $error");
    }
  }

  Future<void> verifyOtp({required String otp}) async{
    try{
      EmailOTP.config();
      EmailOTP.verifyOTP(otp: otp);
    }catch(error){
      print("Error : $error");
    }
  }

  Future<void> resetPassword(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(error){
      print("Error : $error");
    }
  }
}