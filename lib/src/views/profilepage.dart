import 'package:event_app/src/models/usermodel.dart';
import 'package:event_app/src/services/users/userservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
final user1 = FirebaseAuth.instance.currentUser;
class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: UserService().getUserById(user1!.uid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasData){
            return const Center(
              child: Text("No User"),
            );
          }
          UserModel user = snapshot.data;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 27.h,),
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(user.image!),
                  ),
                ),
                SizedBox(height: 20.h,),
                Text(user.name,style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(18, 13, 38, 1)
                ),),
                SizedBox(height: 9.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(user.following.toString(),style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(18, 13, 38, 1)
                        ),),
                        Text("Following",style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(116, 118, 136, 1)
                        ),),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Container(
                        height: 32.h,
                        width: 1.w,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(221, 221, 221, 1)
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(user.followers.toString(),style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(18, 13, 38, 1)
                        ),),
                        Text("Followers",style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(116, 118, 136, 1)
                        ),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 22.h,),
                Container(
                  height: 50.h,
                  width: 154.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.5
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/edit.svg"),
                      SizedBox(width: 16.w,),
                      Text("Edit Profile",style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color:AppColors.primaryColor
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("About Me",style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(18, 13, 38, 1)
                    ),),
                  ],
                ),
                SizedBox(height: 10.h,),
                Text.rich(
                    TextSpan(
                        text: user.about,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(18, 13, 38, 0.5)
                        ),
                        children: [
                          TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.primaryColor
                              )
                          ),
                        ]
                    )
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Interest",style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(23, 43, 77, 1)
                    ),),
                    Container(
                      height: 28.h,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(86, 105, 255, 0.1),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(74, 210, 228, 0.08),
                                offset: Offset(0, 8),
                                blurRadius: 20,
                                spreadRadius: 0
                            )
                          ]
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/edit-3.svg"),
                            SizedBox(width: 6.w,),
                            Text("Interest",style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor
                            ),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 9.h,),
                Expanded(
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 7,mainAxisSpacing: 10,mainAxisExtent: 34),itemCount: user.category?.length, itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 7.h),
                        child: Center(child: Text(user.category![index],style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),)),
                      ),
                    );
                  },),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
