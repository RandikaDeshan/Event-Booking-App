import 'package:event_app/src/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Widget page;
  const AppButton({super.key, required this.text, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) {
          return page;
        },));
      },
      child: Container(
        height: 58.h,
        width: 271.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(111, 126, 201, 0.25),
              offset: Offset(0, 10),
              blurRadius: 35,
              spreadRadius: 0
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(text,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.white
            ),),
            Padding(
              padding:  EdgeInsets.only(top: 14.h,bottom: 14.h,right: 14.w,left: 62.w),
              child: IconButton(
                  style: IconButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color.fromRGBO(61, 86, 240, 1),
                    fixedSize:Size(30.w, 30.h)
                  ),
                  onPressed: (){},
                  icon: Icon(Icons.arrow_forward,color: Colors.white,size: 13,)),
            ),
          ],
        ),
      ),
    );
  }
}
