import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 8.h,right: 16.w),
          child: const CircleAvatar(
            radius: 17,
            backgroundImage: AssetImage("assets/images/Ellipse 52.png"),
          ),
        ),
        SizedBox(
          width: 270.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rocks Velkeinjen",style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color:const Color.fromRGBO(0, 0, 0, 1)
                  ),),
                  Text("10 Feb",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color:const Color.fromRGBO(173, 175, 187, 1)
                  ),),
                ],
              ),
              RatingBar.builder(
                  itemBuilder: (context, index) => const Icon(Icons.star,color:Color.fromRGBO(251, 190, 71, 1),),
                  ignoreGestures: true,
                  itemCount: 4,
                  itemSize: 19,
                  initialRating: 4,
                  onRatingUpdate:(value) {
                    print(value);
                  },),
              SizedBox(height: 7.h,),
              Text("Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.",style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color:const Color.fromRGBO(0, 0, 0, 1)
              ),),
            ],
          ),
        )
      ],
    );
  }
}
