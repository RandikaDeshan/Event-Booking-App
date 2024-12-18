
import 'package:event_app/src/services/auth/authservices.dart';
import 'package:event_app/src/views/auth/signinpage.dart';
import 'package:event_app/src/views/auth/verificationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../utils/appcolors.dart';
import '../../widgets/buttonpage.dart';
import '../../widgets/facebookbutton.dart';
import '../../widgets/googlebutton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
bool password = false;
bool confirmPassword = false;
class _SignUpPageState extends State<SignUpPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = false;
    confirmPassword = false;
  }
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    Text("Sign Up",style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 20.h,),
                    SizedBox(
                      height: 56.h,
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your name';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(228, 223, 223, 1),
                                  width: 1
                              ),
                            ),
                            hintText: "Full name",
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(116, 118, 136, 1)
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 17.h),
                              child: SvgPicture.asset("assets/images/Profile.svg",height: 22.h,width: 22.w,),
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 19.h,),
                    SizedBox(
                      height: 56.h,
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your email';
                          }
                          else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          else{
                            return null;
                          }
                        },
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
                    SizedBox(height: 19.h,),
                    SizedBox(
                      height: 56.h,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your password';
                          }else{
                            return null;
                          }
                        },
                        obscureText: password?false:true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(228, 223, 223, 1),
                                  width: 1
                              ),
                            ),
                            hintText: "Your password",
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(116, 118, 136, 1)
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 17.h),
                              child: SvgPicture.asset("assets/images/Lock.svg",height: 22.h,width: 22.w,),
                            ),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                password = !password;
                              });
                            }, icon: Icon(password?Icons.visibility:Icons.visibility_off,size:24,color:Color.fromRGBO(151, 151, 151, 1),))
                        ),
                      ),
                    ),
                    SizedBox(height: 19.h,),
                    SizedBox(
                      height: 56.h,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please reenter password';
                          }else if(_passwordController.text != value){
                            return 'Confirm password should be equal to password';
                          }
                          else{
                            return null;
                          }
                        },
                        obscureText: confirmPassword?false:true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(228, 223, 223, 1),
                                  width: 1
                              ),
                            ),
                            hintText: "Confirm password",
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(116, 118, 136, 1)
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 17.h),
                              child: SvgPicture.asset("assets/images/Lock.svg",height: 22.h,width: 22.w,),
                            ),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                confirmPassword = !confirmPassword;
                              });
                            }, icon: Icon(confirmPassword?Icons.visibility:Icons.visibility_off,size:24,color:const Color.fromRGBO(151, 151, 151, 1),))
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(height: 36.h,),
                    Center(child: GestureDetector(
                        onTap: () async{
                          if(_formKey.currentState!.validate()){
                          await AuthService().sendOtp(email: _emailController.text);
                          if(context.mounted){
                          Navigator.push(context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => VerificationPage(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text),
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
                        },
                        child: const AppButton(text: 'SIGN UP',)))
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 24.h,),
                Text("OR",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(157, 152, 152, 1)
                ),),
                SizedBox(height: 5.h,),
                const GooGleButton(),
                SizedBox(height: 17.h,),
                const FaceBookButton(),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?  ",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                    ),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignInPage(),
                                transitionsBuilder:(context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 700),
                                reverseTransitionDuration: const Duration(milliseconds: 700)
                            ));
                      },
                      child: Text("Signin",style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor
                      ),),
                    ),
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
