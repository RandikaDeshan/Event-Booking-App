import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapCategoryCard extends StatelessWidget {
  const MapCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      child: Container(
        height: 39.06.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(46, 46, 79, 0.12),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: Offset(0, 6)
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.49.w),
          child: Row(
            children: [
              const Icon(Icons.sports_baseball_outlined,color: Colors.red,),
              SizedBox(width: 8.31.w,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: Text("Sports",style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color:const Color.fromRGBO(138, 141, 159, 1)
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
