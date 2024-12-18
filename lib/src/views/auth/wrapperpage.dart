import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/views/auth/signinpage.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    if(user != null){
      return const NavBarPage();
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: AlertDialog(
          title: const Text('Error'),
          content: const Text('Error signing in with email and password'),
          actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              fixedSize: Size(100.w, 30.h)
            ),
          onPressed: () =>  Navigator.pushReplacement(context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
              transitionsBuilder:(context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 700),
              reverseTransitionDuration: const Duration(milliseconds: 700)
          )),
      child: const Text('OK',style: TextStyle(
        color: Colors.white
      ),),
      ),]
      ),
    );
  }
}
