import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SvgPicture.asset("assets/images/Group 18557.svg"),
          SizedBox(width: 20.w,),
          Text("Login with Facebook",style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400
          ),),
        ],
      ),
    );
  }
}
