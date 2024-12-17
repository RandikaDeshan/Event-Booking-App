import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/eventpage.dart';
import 'package:event_app/src/views/mappage.dart';
import 'package:event_app/src/views/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homepage.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  currentScreen = const HomePage();
                });
              },
              child: Column(
                children: [
                  Icon(Icons.explore,color:_currentIndex==0?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3),),
                  Text("Explore",style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _currentIndex==0?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3)
                  ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  currentScreen = const Eventpage();
                });
              },
              child: Column(
                children: [
                  Icon(Icons.calendar_month_outlined,color:_currentIndex==1?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3),),
                  Text("Events",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _currentIndex==1?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3)
                  ),),
                ],
              ),
            ),
            SizedBox(width: 20.w,),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  currentScreen = const MapPage();
                });
              },
              child: Column(
                children: [
                  Icon(Icons.location_on,color:_currentIndex==2?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3),),
                  Text("Map",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _currentIndex==2?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3)
                  ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                  currentScreen = const ProfilePage();
                });
              },
              child: Column(
                children: [
                  Icon(Icons.person,color:_currentIndex==3?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3),),
                  Text("Profile",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _currentIndex==3?AppColors.primaryColor: const Color.fromRGBO(44, 53, 80, 0.3)
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
      child: const Icon(Icons.add_box,color: Colors.white,),
      ),
      body: PageStorage(bucket: bucket, child: currentScreen),
    );
  }
}
