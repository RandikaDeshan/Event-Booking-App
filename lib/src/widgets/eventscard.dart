import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.h,
      width: 237.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(80, 85, 136, 0.06),
            offset: Offset(0, 8),
            spreadRadius: 0,
            blurRadius: 30
          ),
        ]
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 9.h,left: 9.w,right: 9.w),
            child: Container(
              height: 131.h,
              width: 218.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image: AssetImage("assets/images/image 84.png"),fit: BoxFit.cover)
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(255, 255, 255, 0.7)
                      ),
                      child: Column(
                        children: [
                          Text.rich(
                            textAlign: TextAlign.center,
                              TextSpan(
                                text: "10",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(240, 99, 90, 1)
                                ),
                                children: [
                                  TextSpan(
                                    text: " June",
                                    style:TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(240, 99, 90, 1)
                                    )
                                  )
                                ]
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromRGBO(255, 255, 255, 0.7)
                      ),
                      child: const Icon(Icons.bookmark,color: Color.fromRGBO(235, 87, 87, 1),size: 14,),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h,),
                Text("International Band Mu...",style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1)
                ),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 72.w,
                      child: Stack(
                        children: [
                          Positioned(
                              left: 30,
                              child: Container(
                                height: 24.h,
                                width: 24.w,
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
                              left: 15,
                              child: Container(
                                height: 24.h,
                                width: 24.w,
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
                                height: 24.h,
                                width: 24.w,
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
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    const Icon(Icons.location_on,color: Color.fromRGBO(113, 110, 144, 0.6),size: 16,),
                    Text("36 Guild Street London, UK ",style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(43, 40, 73, 0.6)
                    ),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
