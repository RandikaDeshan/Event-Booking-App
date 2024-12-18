import 'package:event_app/src/views/onboarding/onboardingpages.dart';
import 'package:flutter/material.dart';

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
      Navigator.pushReplacement(context,
          PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingPage(),
          transitionsBuilder:(context, animation, secondaryAnimation, child) {
            return FadeTransition(
                opacity: animation,
                child: child,
            );
          },
              transitionDuration: const Duration(milliseconds: 1500)
          ));
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
