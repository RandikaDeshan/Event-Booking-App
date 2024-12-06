import 'package:event_app/src/views/drawerpage.dart';
import 'package:event_app/src/views/eventdetailspage.dart';
import 'package:event_app/src/views/notificationspage.dart';
import 'package:event_app/src/views/searchpage.dart';
import 'package:event_app/src/widgets/categorycard.dart';
import 'package:event_app/src/widgets/eventscard.dart';
import 'package:event_app/src/widgets/filterpage.dart';
import 'package:event_app/src/widgets/invitesheet.dart';
import 'package:flexible_dropdown/flexible_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
String dwmenu = '5';
final drawerController = AdvancedDrawerController();
class _HomePageState extends State<HomePage> {

  void showDrawer(){
    drawerController.showDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      disabledGestures: true,
      controller: drawerController,
      childDecoration: BoxDecoration(
        borderRadius:BorderRadius.circular(40),
      ),
      animationCurve: Curves.easeInOut,
      drawer: const DrawerPage(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                child: Stack(
                  children: [
                    Container(
                      height: 179.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(33),
                            bottomLeft: Radius.circular(33),
                          ),
                          color:Color.fromRGBO(74, 67, 236, 1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            SizedBox(height: 44.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap:(){
                                      showDrawer();
                                    },
                                    child: SvgPicture.asset("assets/images/Combined Shape.svg")),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Current Location",style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color:const Color.fromRGBO(255, 255, 255, 0.7)
                                        ),),
                                        FlexibleDropdown(overlayChild: Container(
                                          height: 300,
                                          color: Colors.white,
                                        ),
                                          animationType: AnimationType.size,child:const Icon(Icons.arrow_drop_down,color: Colors.white,),
                                        ),
                                      ],
                                    ),
                                    Text("New Yourk, USA",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color:const Color.fromRGBO(244, 244, 254, 1)
                                    ),),
                                  ],
                                ),
                                IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
                                    ),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return const NotificationsPage();
                                      },));
                                    }, icon:Stack(
                                  children: [
                                    const Icon(Icons.notifications_none,color: Colors.white,),
                                    Positioned(
                                      right: 7,
                                      top: 4,
                                      child: Container(
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(2, 233, 254, 1),
                                            shape:BoxShape.circle,
                                            border: Border.all(
                                                color:const Color.fromRGBO(82, 76, 224, 1)
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return const SearchPage();
                                          },));
                                        },
                                        child: SvgPicture.asset("assets/images/search.svg")),
                                    SizedBox(width: 10.w,),
                                    Container(
                                      width: 1.w,
                                      height: 20.h,
                                      decoration: const BoxDecoration(
                                          border: Border(left: BorderSide(
                                              color: Color.fromRGBO(121, 116, 231, 1),
                                              width: 1
                                          ))
                                      ),),
                                    SizedBox(
                                      width: 200.w,
                                      height: 23.h,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Search...",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20.sp,
                                                color:const Color.fromRGBO(255, 255, 255, 0.3)
                                            ),
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide.none
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showBarModalBottomSheet(context: context, builder: (context) {
                                      return const FilterPage();
                                    },);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(93, 86, 243, 1),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset("assets/images/Vector.svg"),
                                          SizedBox(width: 4.w,),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.h),
                                            child: Text("Filters",style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                                color:const Color.fromRGBO(255, 255, 255, 0.7)
                                            ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 40.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(itemCount: 10,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                          return const CategoryCard();
                        },),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 21.58.h,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upcoming Events",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color:const Color.fromRGBO(18, 13, 38, 1)
                        ),),
                        Row(
                          children: [
                            Text("See All",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color:const Color.fromRGBO(116, 118, 136, 1)
                            ),),
                            const Icon(Icons.arrow_right_outlined,color: Color.fromRGBO(116, 118, 136, 1),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 19.h,),
                  SizedBox(
                    height: 260.h,
                    child: ListView.builder(itemCount: 10,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const EventDetailsPage();
                            },));
                          },
                          child: const EventCard());
                    },),
                  ),
                  SizedBox(height: 29.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      height: 127.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(0, 248, 255, 0.16),
                          image: const DecorationImage(image: AssetImage("assets/images/77mLIhf8TW 1.png"),alignment:Alignment.bottomRight,)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.w,top: 13.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Invite your friends",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color:const Color.fromRGBO(18, 13, 38, 1)
                            ),),
                            Text("Get \$20 for ticket",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                color:const Color.fromRGBO(72, 77, 112, 1)
                            ),),
                            SizedBox(height: 13.h,),
                            TextButton(onPressed: (){
                              showBarModalBottomSheet(context: context, builder: (context) {
                                return const InviteSheet();
                              },);
                            },
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(0, 248, 255, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 4.h),
                                  child: Text("INVITE",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color:Colors.white
                                  ),),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nearby You",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color:const Color.fromRGBO(18, 13, 38, 1)
                        ),),
                        Row(
                          children: [
                            Text("See All",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color:const Color.fromRGBO(116, 118, 136, 1)
                            ),),
                            const Icon(Icons.arrow_right_outlined,color: Color.fromRGBO(116, 118, 136, 1),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),);
  }
}
