
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/views/onboarding/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SplashPage();
          }
          else if(snapshot.hasData){
            return const NavBarPage();
          }
          return const SplashPage();
        },
    );
  }
}
