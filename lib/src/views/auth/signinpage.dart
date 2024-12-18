import 'package:event_app/src/services/auth/authservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/auth/resetpwpage.dart';
import 'package:event_app/src/views/auth/signuppage.dart';
import 'package:event_app/src/views/auth/wrapperpage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:event_app/src/widgets/facebookbutton.dart';
import 'package:event_app/src/widgets/googlebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}
bool switchValue = false;
bool password = false;
class _SignInPageState extends State<SignInPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = false;
    switchValue = false;
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn() async{
    try{
      await AuthService().signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WrapperPage();
      },));
    }catch(error){
      print("Error : $error");
      showDialog(context: context, builder: (context) {
        return const AlertDialog(
          title: Text("Error"),
          content: Text("Invalid email or password"),
        );
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: 73.h,),
                    const Center(child: Image(image: AssetImage("assets/images/Group 33499.png"))),
                    SizedBox(height: 30.h,),
                    Text("Sign In",style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 21.h,),
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
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                activeTrackColor: AppColors.primaryColor,
                                trackOutlineColor:const WidgetStatePropertyAll(Colors.transparent),
                                value: switchValue,
                                onChanged:(value) {
                                setState(() {
                                  switchValue = value;
                                });
                              },),
                            ),
                            SizedBox(width: 8.7.w,),
                            Text("Remember Me",style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const ResetPWPage(),
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
                          child: Text("Forgot Password?",style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h,),
                    Center(child: GestureDetector(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                        signIn();}
                      },
                        child: const AppButton(text: 'SIGN IN')))
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
                    Text("Don’t have an account?  ",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400
                    ),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
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
                            ));
                      },
                      child: Text("Sign up",style: TextStyle(
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
