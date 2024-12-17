import 'package:event_app/src/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    String body = "invite";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 22.5,
              backgroundImage: AssetImage("assets/images/Ellipse 58.png"),
            ),
            SizedBox(width: 14.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: "David Silbia",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: " Invite Jo Malone London’s Mother’s ",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color:const Color.fromRGBO(112, 109, 109, 1)
                          ),
                        )
                      ]
                    )
                  ),
                ),
                Visibility(
                  visible: body == "invite",
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Row(
                      children: [
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              fixedSize: Size.fromHeight(36.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  width: 1
                                )
                              )
                            ),
                            child: Text("Reject",style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(112, 109, 109, 1)
                            ),)),
                        SizedBox(width: 13.w,),
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                fixedSize: Size.fromHeight(36.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                )
                            ),
                            child: Text("Accept",style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1)
                            ),))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Text("Just now",style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color:const Color.fromRGBO(60, 62, 86, 1)
        ),),
      ],
    );
  }
}
