import 'package:event_app/src/models/eventimages.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/views/searchpage.dart';
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
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(categories: [],),
                        transitionsBuilder:(context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 700),
                        reverseTransitionDuration: const Duration(milliseconds: 700)
                    ));
              },
              child: SvgPicture.asset("assets/images/search.svg",color:const Color.fromRGBO(18, 13, 38, 1),)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Color.fromRGBO(6, 5, 24, 1),))
        ],
      ),
      body: FutureBuilder(
        future: EventService().getEvents(),
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
          return  ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
            EventModel event = snapshot.data[index];
            return Padding(
              padding:EdgeInsets.symmetric(horizontal: 24.w,vertical: 6.h),
              child: SearchEventCard(id: event.eventId, image: EventImages().eventImages[index],),
            );
          },);
        },
      ),
    );
  }
}
