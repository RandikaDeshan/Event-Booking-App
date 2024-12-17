import 'package:event_app/src/models/eventimages.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:event_app/src/models/reviewmodel.dart';
import 'package:event_app/src/models/usermodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/widgets/reviewcard.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../services/review/reviewservice.dart';
import '../utils/appcolors.dart';

class OrganiZerPage extends StatefulWidget {
  final String id;
  const OrganiZerPage({super.key, required this.id});

  @override
  State<OrganiZerPage> createState() => _OrganiZerPageState();
}

class _OrganiZerPageState extends State<OrganiZerPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Color.fromRGBO(6, 5, 24, 1),))
          ],
        ),
        body: FutureBuilder(
          future: UserService().getUserById(widget.id),
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage(user.image!),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(user.name,style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(18, 13, 38, 1)
                    ),),
                    SizedBox(height: 9.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(user.following.toString(),style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(18, 13, 38, 1)
                            ),),
                            Text("Following",style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(116, 118, 136, 1)
                            ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Container(
                            height: 32.h,
                            width: 1.w,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(221, 221, 221, 1)
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(user.followers.toString(),style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(18, 13, 38, 1)
                            ),),
                            Text("Followers",style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(116, 118, 136, 1)
                            ),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 22.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.h,
                          width: 154.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,
                              border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1.5
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/user-plus.svg"),
                              SizedBox(width: 16.w,),
                              Text("Follow",style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color:Colors.white
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(width: 17.w,),
                        Container(
                          height: 50.h,
                          width: 154.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1.5
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/message-circle.svg"),
                              SizedBox(width: 16.w,),
                              Text("Massages",style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color:AppColors.primaryColor
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 30.h,),
                    TabBar(
                      tabs: const [
                        Tab(text: "ABOUT",),
                        Tab(text: "EVENT",),
                        Tab(text: "REVIEWS",),
                      ],
                      dividerHeight: 0,
                      indicatorColor: AppColors.primaryColor,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color:const Color.fromRGBO(116, 118, 136, 1)
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color:AppColors.primaryColor
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.w),
                      child: SizedBox(
                        height: 320.h,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(children: [
                          Text.rich(
                              TextSpan(
                                  text: user.about,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(18, 13, 38, 0.5)
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Read More",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w100,
                                            color: AppColors.primaryColor
                                        )
                                    ),
                                  ]
                              )
                          ),
                          FutureBuilder(
                            future: EventService().getEventsByUserId(user.userid),
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
                              return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                                EventModel event = snapshot.data[index];
                                return Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.h),
                                  child:  SearchEventCard(id: event.eventId, image: EventImages().eventImages[index],),
                                );
                              },);
                            },
                          ),
                          FutureBuilder(
                            future: ReviewService().getReviewsByEventId('event01'),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              else if(!snapshot.hasData){
                                return const Center(
                                  child: Text("No Reviews"),
                                );
                              }
                              return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                                ReviewModel review = snapshot.data[index];
                                return Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 8.h),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7.5.h),
                                    child: ReviewCard(id: review.id,),
                                  ),
                                );
                              },);
                            },
                          ),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
