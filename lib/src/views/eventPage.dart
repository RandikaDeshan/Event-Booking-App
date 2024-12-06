import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/widgets/pastevents.dart';
import 'package:event_app/src/widgets/upcomingevents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Eventpage extends StatefulWidget {
  const Eventpage({super.key});

  @override
  State<Eventpage> createState() => _EventpageState();
}
int page = 0;
class _EventpageState extends State<Eventpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Events",style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Color.fromRGBO(6, 5, 24, 1),))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.12.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.w),
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.03),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          page = 0;
                        });
                      },
                      child: Container(
                        height:45.h,
                        decoration: BoxDecoration(
                          color: page == 0?Colors.white:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset: Offset(0, 5)
                            )
                          ]
                        ),
                        child: Center(
                          child: Text("UPCOMING",style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: page == 0 ? AppColors.primaryColor : const Color.fromRGBO(155, 155, 155, 1)
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          page = 1;
                        });
                      },
                      child: Container(
                        height:45.h,
                        decoration: BoxDecoration(
                            color: page == 1 ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child: Center(
                          child: Text("PAST EVENTS",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: page == 1 ? AppColors.primaryColor : const Color.fromRGBO(155, 155, 155, 1)
                          ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: page == 0 ? const UpcomingEvents():const PastEvents(),
            ),
          )

        ],
      )
    );
  }
}
