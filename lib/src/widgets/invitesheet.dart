import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/homepage.dart';
import 'package:event_app/src/widgets/buttonpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteSheet extends StatefulWidget {
  const InviteSheet({super.key});

  @override
  State<InviteSheet> createState() => _InviteSheetState();
}

List users = [
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
  {
    "name" : "Alex Lee",
    "isSelected" : false,
  },
];

List selectedUsers = [];

class _InviteSheetState extends State<InviteSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/3 * 2.7,
      child: Stack(
        children: [Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 34.h,),
              Text("Invite Friend",style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color:const Color.fromRGBO(18, 13, 38, 1)
              ),),
              SizedBox(height: 7.h,),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(240, 240, 240, 0.3),
                      width: 1.24
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color:const Color.fromRGBO(129, 147, 174, 0.7)
                  ),
                  suffixIcon: Icon(Icons.search,size: 16,color: AppColors.primaryColor,),
                ),
              ),
              SizedBox(height: 37.h,),
              Expanded(
                  child:ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
                    final user = users[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 22.5,
                                backgroundImage: AssetImage("assets/images/Ellipse 58.png"),
                              ),
                              SizedBox(width: 11.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user["name"],style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color:const Color.fromRGBO(18, 13, 38, 1)
                                  ),),
                                  SizedBox(height: 4.h,),
                                  Text("2k Follwers",style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color:const Color.fromRGBO(116, 118, 136, 1)
                                  ),),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                user["isSelected"] = !user["isSelected"];
                              });
                            },
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:user['isSelected'] == true ? AppColors.primaryColor : const Color.fromRGBO(226, 226, 226, 1)
                              ),
                              child: const Icon(Icons.check,color: Colors.white)
                            ),
                          )
                        ],
                      ),
                    );
                  },) )
            ],
          ),
        ),
        const Positioned(
            bottom: 27,
            left: 50,
            right: 50,
            child: AppButton(text: "Invite", page: HomePage())),
        ]
      ),
    );
  }
}
