import 'package:event_app/src/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchEventCard extends StatelessWidget {
  const SearchEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(83, 89, 144, 0.07),
            offset: Offset(0, 8),
            spreadRadius: 0,
            blurRadius: 25
          ),
        ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 92.h,
              width: 79.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image: AssetImage("assets/images/image 84.png"),fit: BoxFit.cover)
              ),
            ),
          ),
          SizedBox(width: 18.w,),
          SizedBox(
            width: 190.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1st  May- Sat -2:00 PM",style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color:AppColors.primaryColor
                ),),
                Text("A virtual evening of smooth jazz",style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color:const Color.fromRGBO(18, 13, 38, 1)
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
