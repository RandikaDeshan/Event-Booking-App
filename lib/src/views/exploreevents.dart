import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExploreEventsPage extends StatelessWidget {
  const ExploreEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const NavBarPage();
          },));
        }, icon: const Icon(Icons.arrow_back)),
        title:  Text("Events",style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        actions: [
          SvgPicture.asset("assets/images/search.svg",color:const Color.fromRGBO(18, 13, 38, 1),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Color.fromRGBO(6, 5, 24, 1),))
        ],
      ),
      body: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
        return Padding(
          padding:EdgeInsets.symmetric(horizontal: 24.w,vertical: 6.h),
          child: const SearchEventCard(),
        );
      },),
    );
  }
}
