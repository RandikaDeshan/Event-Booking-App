import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.94.w,top: 45.28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/Rectangle 4158.png"),
            ),
            SizedBox(height: 12.44.h,),
            Text("Ashfak Sayem",style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(0, 0, 0, 1)
            ),),
            SizedBox(height: 48.28.h,),
            Row(
              children: [
                const Icon(Icons.person_outline,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("My Profile",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                Stack(
                    children:[
                      const Icon(Icons.chat_bubble_outline_rounded,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 14.w,
                    height: 14.h,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orangeAccent
                    ),
                    child: Center(
                      child: Text("3",style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1)
                      ),),
                    ),
                  ),
                )
                ]),
                SizedBox(width: 14.w,),
                Text("Massage",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Calender",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.bookmark_border_outlined,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Bookmark",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.mail_outline_rounded,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Contact Us",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.settings_outlined,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Settings",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.help_outline_outlined,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Helps & FAQs",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                const Icon(Icons.login_outlined,size: 23,color: Color.fromRGBO(118, 118, 118, 1),),
                SizedBox(width: 14.w,),
                Text("Sign Out",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
