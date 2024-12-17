import 'package:event_app/src/models/eventimages.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/views/eventpage.dart';
import 'package:event_app/src/views/exploreevents.dart';
import 'package:event_app/src/views/homepage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    int length = 0;
    return Scaffold(
      body:FutureBuilder(
        future: EventService().getEvents(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasData){
            return Column(
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
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ExploreEventsPage();
                      },));
                    },
                    child: const AppButton(text: "EXPLORE EVENTS", ))
              ],
            );
          }
          return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
            EventModel event = snapshot.data[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 8.h),
              child: Visibility(
                  visible: event.date.isAfter(DateTime.now()),
                  child: SearchEventCard(id:event.eventId, image: EventImages().eventImages[index] ,)),
            );
          },);
        },
      ),
    );
  }
}
