import 'package:date_time_format/date_time_format.dart';
import 'package:event_app/src/models/reviewmodel.dart';
import 'package:event_app/src/services/review/reviewservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  final String id;
  const ReviewCard({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReviewService().getReviewsById(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center();
        }
        else if(!snapshot.hasData){
          return const Center(
            child: Text("No Reviews"),
          );
        }
        ReviewModel review = snapshot.data;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 8.h,right: 16.w),
              child:  CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage(review.image),
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
                      Text(review.name,style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color:const Color.fromRGBO(0, 0, 0, 1)
                      ),),
                      Text(DateTimeFormat.format(review.createdAt,format: 'd M'),style: TextStyle(
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
                    initialRating: review.rate.toDouble(),
                    onRatingUpdate:(value) {
                      print(value);
                    },),
                  SizedBox(height: 7.h,),
                  Text(review.description,style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color:const Color.fromRGBO(0, 0, 0, 1)
                  ),),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
