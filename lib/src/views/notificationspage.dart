import 'package:event_app/src/widgets/notificationcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int items = 10;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Notification",style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Color.fromRGBO(6, 5, 24, 1),))
        ],
      ),
      body: items == 0 ? Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Image(image: AssetImage("assets/images/Artwork.png"))),
            SizedBox(height: 40.5.h,),
            Text("No Notifications!",style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(52, 75, 103, 1)
            ),),
            SizedBox(height: 7.h,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor",style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(52, 75, 103, 0.7)
            ),textAlign: TextAlign.center,),
          ],
        ),
      ) : Padding(
        padding:  EdgeInsets.only(top: 30.h),
        child: ListView.builder(itemCount: items,itemBuilder: (context, index) {
          return Padding(
            padding:EdgeInsets.symmetric(horizontal: 24.w,vertical: 8.h),
            child: const NotificationCard(),
          );
        },),
      ),
    );
  }
}
