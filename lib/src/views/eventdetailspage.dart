import 'package:date_time_format/date_time_format.dart';
import 'package:event_app/src/models/usermodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/views/organizerpage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:event_app/src/widgets/sharesheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/eventmodel.dart';

class EventDetailsPage extends StatefulWidget {
  final String id;
  final String image;
  const EventDetailsPage({super.key, required this.image, required this.id});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: EventService().getEventsById(widget.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasData){
            return const Center(
              child: Text("No Events"),
            );
          }
          EventModel event = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 284.h,
                  child: Stack(
                    children: [
                      Container(
                        height: 244.h,
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                            image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 48.h,left: 20.w,right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 22,)),
                                  SizedBox(width: 13.w,),
                                  Text("Event Details",style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),),
                                ],
                              ),
                              Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.bookmark,color: Colors.white,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 50,
                        right: 50,
                        child: Container(
                          width: 295.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(254, 254, 255, 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 34.18.h,
                                      width: 80.w,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              left: 40,
                                              child: Container(
                                                height: 34.18.h,
                                                width: 34.18.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1
                                                    ),
                                                    shape:BoxShape.circle,
                                                    image: const DecorationImage(image: AssetImage("assets/images/Oval Copy 4.png"),fit: BoxFit.cover)
                                                ),
                                              )
                                          ),
                                          Positioned(
                                              left: 20,
                                              child: Container(
                                                height: 34.18.h,
                                                width: 34.18.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1
                                                    ),
                                                    shape:BoxShape.circle,
                                                    image: const DecorationImage(image: AssetImage("assets/images/Oval Copy.png"),fit: BoxFit.cover)
                                                ),
                                              )),
                                          Positioned(
                                              left: 0,
                                              child: Container(
                                                height: 34.18.h,
                                                width: 34.18.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1
                                                    ),
                                                    shape:BoxShape.circle,
                                                    image: const DecorationImage(image: AssetImage("assets/images/Oval.png"),fit: BoxFit.cover)
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Text("+20 Going",style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(63, 56, 221, 1)
                                    ),),
                                  ],
                                ),
                                TextButton(onPressed: (){
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return const ShareSheet();
                                  },);
                                },
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                        backgroundColor: AppColors.primaryColor,
                                        fixedSize: Size(67.w, 28.h),
                                        shadowColor: const Color.fromRGBO(74, 210, 228, 0.08)
                                    ),
                                    child: Text("INVITE",style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      Center(
                        child: Text(event.title,style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(18, 13, 38, 1)
                        ),),
                      ),
                      SizedBox(height: 18.h,),
                      Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: const  Color.fromRGBO(86, 105, 255, 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.calendar_month_outlined,color: AppColors.primaryColor,size: 30,),
                          ),
                          SizedBox(width: 14.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateTimeFormat.format(event.date,format: "j F Y"),style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(18, 13, 38, 1)
                              ),),
                              Text(
                                "${
                                  DateTimeFormat.format(event.date,
                                      format: 'l, g:iA')
                                } - ${DateTimeFormat.format(event.endTime,format: 'g:iA')}",style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(116, 118, 136, 1)
                              ),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: const  Color.fromRGBO(86, 105, 255, 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.location_on,color: AppColors.primaryColor,size: 30,),
                          ),
                          SizedBox(width: 14.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event.venue,style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(18, 13, 38, 1)
                              ),),
                              Text(event.address,style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(116, 118, 136, 1)
                              ),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      FutureBuilder(
                        future: UserService().getUserById(event.userId),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          else if(!snapshot.hasData){
                            return const Center(
                              child: Text("No User"),
                            );
                          }
                          UserModel user = snapshot.data;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(OrganiZerPage(id: user.userid,),transition: Transition.zoom,duration: const Duration(milliseconds: 700));
                                    },
                                    child: Container(
                                      width: 44.w,
                                      height: 44.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(image: AssetImage(user.image!),fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 13.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(user.name,style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(13, 12, 38, 1)
                                      ),),
                                      Text("Organizer",style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(112, 110, 143, 1)
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                              TextButton(onPressed: (){},
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(86, 105, 255, 0.12),
                                      fixedSize: Size(60.w, 28.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      shadowColor: const Color.fromRGBO(74, 210, 228, 0.08)
                                  ),
                                  child: Text("Follow",style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor
                                  ),))
                            ],
                          );
                        },

                      ),
                      SizedBox(height: 21.h,),
                      Text("About Event",style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(18, 13, 38, 1)
                      ),),
                      SizedBox(height: 8.h,),
                      SizedBox(
                        height: 149.h,
                        child: Stack(
                            children:[ Text(event.description,style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(18, 13, 38, 1)
                            ),
                              overflow: TextOverflow.fade,
                            ),
                              Container(
                                height: 149.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(255, 255, 255, 0),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                                ),
                                child:  Center(child:  AppButton(text: "Buy Ticket \$${event.price}",)),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}
