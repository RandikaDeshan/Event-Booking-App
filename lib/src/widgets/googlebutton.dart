import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/views/auth/wrapperpage.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GooGleButton extends StatelessWidget {
  const GooGleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await UserService().googleSaveUser();
        if(context.mounted){
        Navigator.pushReplacement(context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const WrapperPage(),
                transitionsBuilder:(context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 700),
                reverseTransitionDuration: const Duration(milliseconds: 700)
            ));}
      },
      child: Container(
        height: 56.h,
        width: 273.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(211, 212, 226, 0.25),
              offset: Offset(15, 0),
              spreadRadius: 0,
              blurRadius: 15
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/super g.svg"),
            SizedBox(width: 20.w,),
            Text("Login with Google",style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400
            ),),
          ],
        ),
      ),
    );
  }
}
