import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/views/onboarding/onboardingpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goToHome();
  }

  _goToHome()async{
    await Future.delayed(const Duration(milliseconds: 3000,),(){});
    if(mounted){
      Get.to(const OnBoardingPage(),transition: Transition.zoom,duration: const Duration(milliseconds: 700),popGesture: false);
  }}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/images/Group 34056.png")),
      ),
    );
  }
}
