import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/auth/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}
int no = 0;
class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    no = 0;
  }
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 200.h),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              no = value;
            });
          },
          controller: controller,
          children: const [
            Image(image: AssetImage("assets/images/Group 33331.png")),
            Image(image: AssetImage("assets/images/Group 33332.png")),
            Image(image: AssetImage("assets/images/Group 33333.png")),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 288.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                color: AppColors.primaryColor
              ),
        child: Padding(
          padding: EdgeInsets.only(top: 40.h,left: 40.w,right: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                    Column(
                      children: [
                        Text(no == 0?"Explore Upcoming and Nearby Events":no==1?"Web Have Modern Events Calendar Feature":"  To Look Up More Events or Activities Nearby By Map",style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h,),
                        Text("In publishing and graphic design, Lorem is a placeholder text commonly",style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              Padding(
                padding: EdgeInsets.only(bottom: 37.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
                                transitionsBuilder:(context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              transitionDuration: const Duration(milliseconds: 1500)
                              ));
                        },
                        child: Text("Skip",style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color:const Color.fromRGBO(255, 255, 255, 0.5)
                        ),)
                    ),
                    SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 8,
                          activeDotColor: Colors.white,
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          dotColor: Colors.white24
                        ),
                    ),
                    TextButton(
                        onPressed: (){
                          if(no == 2){
                            Navigator.pushReplacement(context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
                                  transitionsBuilder:(context, animation, secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                    transitionDuration: const Duration(milliseconds: 1500)
                                ));
                          }
                          controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                        },
                        child: Text("Next",style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color:const Color.fromRGBO(255, 255, 255, 1)
                        ),)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
