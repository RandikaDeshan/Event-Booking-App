import 'package:event_app/src/views/exploreevents.dart';
import 'package:event_app/src/views/homepage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    int length = 0;
    return Scaffold(
      body: length == 0 ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage("assets/images/Mask Group.png"))),
          SizedBox(height: 31.h,),
          Text("No Upcoming Event",style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(18, 13, 38, 1)
          ),),
          SizedBox(height: 13.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 54.w),
            child: Text("Lorem ipsum dolor sit amet, consectetur ",style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(116, 118, 136, 1)
            ),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 50.h,),
          const AppButton(text: "EXPLORE EVENTS", page: ExploreEventsPage())
        ],
      ):ListView.builder(itemCount: length,itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 8.h),
          child: const SearchEventCard(),
        );
      },),
    );
  }
}
