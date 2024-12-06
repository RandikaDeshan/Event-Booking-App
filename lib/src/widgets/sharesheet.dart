import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareSheet extends StatelessWidget {
  const ShareSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 34.h,left: 24.w,bottom: 23.h),
            child: Text("Share with friends",style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color:const Color.fromRGBO(18, 13, 38, 1)
            ),),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(239, 233, 233, 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset("assets/images/Group 33451.svg"),
                        )),
                    SizedBox(height: 20.h,),
                    Text("Copy Link",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33440.svg"),
                    Text("WhatsApp",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33438.svg"),
                    Text("Facebook",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33446.svg"),
                    Text("Messenger",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33439.svg"),
                    Text("Twitter",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33449.svg"),
                    Text("Instagram",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33450.svg"),
                    Text("Skype",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/images/Group 33441.svg"),
                    Text("Massage",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color:const Color.fromRGBO(60, 62, 86, 1)
                    ),),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 34.h,),
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 52.w),
              child: TextButton(onPressed: (){},
                  style: TextButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width,58.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color.fromRGBO(238, 238, 239, 1)
                  ),
                  child: Text("CANCEL",style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color:const Color.fromRGBO(72, 70, 70, 1)
                  ),)),
            ),
          ),
        ],
      ),
    );
  }
}
