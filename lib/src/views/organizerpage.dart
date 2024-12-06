import 'package:event_app/src/widgets/reviewcard.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/appcolors.dart';

class OrganiZerPage extends StatefulWidget {
  const OrganiZerPage({super.key});

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage("assets/images/image 89.png"),
                  ),
                ),
                SizedBox(height: 20.h,),
                Text("Ashfak Sayem",style: TextStyle(
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
                        Text("350",style: TextStyle(
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
                        Text("346",style: TextStyle(
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
                              text: "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. ",
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
                      ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.h),
                          child: const SearchEventCard(),
                        );
                      },),
                      ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.h),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 7.5.h),
                            child: const ReviewCard(),
                          ),
                        );
                      },),
                    ]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
