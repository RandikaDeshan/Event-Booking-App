import 'dart:async';

import 'package:event_app/src/services/auth/authservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/auth/signuppage.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../models/usermodel.dart';
import '../../services/users/userservices.dart';

class VerificationPage extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  const VerificationPage({super.key, required this.name, required this.email, required this.password});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  int countdown = 20;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }


  bool _isClicked1 = false;
  bool _isClicked2 = false;
  bool _isClicked3 = false;
  bool _isClicked4 = false;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();

  Future<void> createUser() async{
    try{
      bool? verified = await AuthService().verifyOtp(otp: _firstController.text+_secondController.text+_thirdController.text+_fourthController.text);
      if(verified!){await UserService().saveUser(UserModel(
          userid: "",
          name: widget.name,
          email: widget.email,
      ),widget.password);
      if(mounted){
      Navigator.pushReplacement(context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const NavBarPage(),
              transitionsBuilder:(context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 700),
              reverseTransitionDuration: const Duration(milliseconds: 700)
          ));
      }}
      else{
        if(mounted){
        showDialog(context: context, builder: (context) {
          return  AlertDialog(
            title: const Text("Error"),
            content: Text(_firstController.text.isEmpty ?"Invalid email":"Invalid code"),
            actions: [
              TextButton(onPressed: (){
                _firstController.text.isEmpty ?Navigator.pushReplacement(context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
                        transitionsBuilder:(context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 700),
                        reverseTransitionDuration: const Duration(milliseconds: 700)
                    )) : Navigator.pop(context);
              }, child: const Text("Back"))
            ],
          );
        },);}
      }

    }catch(error){
      print("Error : $error");
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
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
                Text("Verification",style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 12.h,),
                SizedBox(
                  width: 244.w,
                  child: Text("We’ve send you the verification code on +1 2620 0323 7631",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400
                  ),),
                ),
                SizedBox(height: 27.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 55.w,
                      child: TextFormField(
                        controller: _firstController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onTap: () {
                          setState(() {
                            _isClicked1 = true;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _isClicked1?AppColors.primaryColor:const Color.fromRGBO(228, 223, 223, 1),
                                    width: 1
                                )
                            ),
                            hintText: "-",
                            hintStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color:const Color.fromRGBO(218, 218, 218, 1)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                      width: 55.w,
                      child: TextFormField(
                        controller: _secondController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onTap: () {
                          setState(() {
                            _isClicked2 = true;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _isClicked2?AppColors.primaryColor:Color.fromRGBO(228, 223, 223, 1),
                                    width: 1
                                )
                            ),
                            hintText: "-",
                            hintStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color:const Color.fromRGBO(218, 218, 218, 1)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                      width: 55.w,
                      child: TextFormField(
                        controller: _thirdController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onTap: () {
                          setState(() {
                            _isClicked3 = true;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _isClicked3?AppColors.primaryColor:Color.fromRGBO(228, 223, 223, 1),
                                    width: 1
                                )
                            ),
                            hintText: "-",
                            hintStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color:const Color.fromRGBO(218, 218, 218, 1)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                      width: 55.w,
                      child: TextFormField(
                        controller: _fourthController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        onTap: () {
                          setState(() {
                            _isClicked4 = true;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _isClicked4?AppColors.primaryColor:Color.fromRGBO(228, 223, 223, 1),
                                    width: 1
                                )
                            ),
                            hintText: "-",
                            hintStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                                color:const Color.fromRGBO(218, 218, 218, 1)
                            )
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: () async{
                      // await checkOtp();
                      await createUser();
                    },
                    child: const AppButton(text: "CONTINUE",)),
                SizedBox(height: 24.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        if(countdown == 0){
                          await AuthService().sendOtp(email: widget.email);
                          setState(() {
                            countdown = 20;
                          });
                          startTimer();
                        }
                      },
                      child: Text("Re-send code in  ",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                      ),),
                    ),
                    Text(countdown>9?"0:$countdown":"0:0$countdown",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor
                    ),),
                  ],
                ),
                SizedBox(height: 38.h,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
