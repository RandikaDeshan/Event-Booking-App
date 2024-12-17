import 'package:date_time_format/date_time_format.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/eventdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchEventCard extends StatelessWidget {
  final String image;
  final String id;
  const SearchEventCard({super.key, required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EventService().getEventsById(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
          );
        }
        else if(!snapshot.hasData){
          return const Center(
            child: Text("No Events"),
          );
        }
        EventModel event = snapshot.data;
        return GestureDetector(
          onTap: () {
            Get.to(EventDetailsPage(image: image, id: id),transition: Transition.zoom,duration: const Duration(milliseconds: 700));
          },
          child: Container(
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
                        image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
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
                      Text(DateTimeFormat.format(event.date,format: "jS F-D -g:i A"), style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color:AppColors.primaryColor
                      ),),
                      Text(event.title,style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color:const Color.fromRGBO(18, 13, 38, 1)
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
