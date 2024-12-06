import 'package:event_app/src/views/auth/signinpage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResetPWPage extends StatelessWidget {
  const ResetPWPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text("Resset Password",style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 12.h,),
                SizedBox(
                  width: 244.w,
                  child: Text("Please enter your email address to request a password reset",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400
                  ),),
                ),
                SizedBox(height: 26.h,),
                SizedBox(
                  height: 56.h,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(228, 223, 223, 1),
                              width: 1
                          ),
                        ),
                        hintText: "abc@email.com",
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(116, 118, 136, 1)
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 17.h),
                          child: SvgPicture.asset("assets/images/Message.svg",height: 22.h,width: 22.w,),
                        )
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const AppButton(text: 'SEND', page: SignInPage()),
                SizedBox(height: 38.h,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
