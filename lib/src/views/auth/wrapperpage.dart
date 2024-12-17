import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/views/auth/signinpage.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return  const SignInPage();
  }
}
