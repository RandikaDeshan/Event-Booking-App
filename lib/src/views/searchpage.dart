import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/widgets/filterpage.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        titleSpacing: 11,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/search.svg",color:AppColors.primaryColor),
                    SizedBox(width: 10.w,),
                    Container(
                      width: 1.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                          border: Border(left: BorderSide(
                              color: Color.fromRGBO(121, 116, 231, 1),
                              width: 1
                          ))
                      ),),
                    SizedBox(
                      width: 180.w,
                      height: 33.h,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 24.sp,
                                color:const Color.fromRGBO(0, 0, 0, 0.3)
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
                      return FilterPage();
                    },);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/Vector.svg"),
                          SizedBox(width: 4.w,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text("Filters",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color:const Color.fromRGBO(236, 235, 252, 1)
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 29.h,),
            Expanded(
                child:ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                  return Padding(
                    padding:EdgeInsets.symmetric(vertical: 8.h),
                    child: const SearchEventCard(),
                  );
                },) ),
          ],
        ),
      ),
    );
  }
}
