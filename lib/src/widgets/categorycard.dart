import 'package:event_app/src/models/categorymodel.dart';
import 'package:event_app/src/services/category/categoryservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String id;
  final String image;
  const CategoryCard({super.key, required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryService().getCategoryById(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
          );
        }
        else if(!snapshot.hasData){
          return const Center(
            child: Text("No Category"),
          );
        }
        CategoryModel category = snapshot.data;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w),
          child: Container(
            height: 39.06.h,
            decoration: BoxDecoration(
                color:Color(int.parse(category.color)),
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
                  Transform.scale(
                      scale: 0.7,
                      child: SvgPicture.asset(image,color: Colors.white,)),
                  SizedBox(width: 8.31.w,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Text(category.name,style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
