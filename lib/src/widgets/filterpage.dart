import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}


final controller = GroupButtonController();
List buttons = [
  {
    "name" : "Sports",
    "img" : "Group.svg",
    "isSelected" : false,
  },
  {
    "name" : "Music",
    "img" : "1381174.svg",
    "isSelected" : false,
  },
  {
    "name" : "Art",
    "img" : "Group1.svg",
    "isSelected" : false,
  },
  {
    "name" : "Food",
    "img" : "685352.svg",
    "isSelected" : false,
  },
  {
    "name" : "Sports",
    "img" : "Group.svg",
    "isSelected" : false,
  },
  {
    "name" : "Sports",
    "img" : "Group.svg",
    "isSelected" : false,
  },
];

List<String> selectedCategories = [];
class _FilterPageState extends State<FilterPage> {
  SfRangeValues _values = const SfRangeValues(0, 250);
  DateTime? date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttons;
    controller;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/3 * 2.7,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 29.h,left: 20.w,bottom: 20.h),
              child: Text("Filter",style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 1)
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(
                height: 98.h,
                child: ListView.builder(itemCount: buttons.length,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                  final button = buttons[index];
                  return Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        child: IconButton(onPressed: ()async{
                          setState(() {
                            button["isSelected"] = !button["isSelected"];
                          });
                          if(button['isSelected']){
                            selectedCategories.add(button["name"]);
                          }else{
                            selectedCategories.remove(button["name"]);
                          }
                        },
                          style: IconButton.styleFrom(
                              backgroundColor: button["isSelected"] ? AppColors.primaryColor : Colors.white,
                              fixedSize: Size(63.29.w, 63.29.h),
                              shape: CircleBorder(
                                side: button["isSelected"] ? BorderSide.none : const BorderSide(color: Color.fromRGBO(229, 229, 229, 1),
                                    width: 0.87),
                              )
                          ),
                          icon: SvgPicture.asset("assets/images/${button['img']}",color:button["isSelected"] ? Colors.white :  const Color.fromRGBO(182, 182, 182, 1),),),
                      ),
                      SizedBox(height: 11.h,),
                      Text(button["name"],style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(18, 13, 38, 1)
                      ),),
                    ],
                  );
                },),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top: 20.97.h,bottom: 12.h),
              child: Text("Time & Date",style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(18, 13, 38, 1)
              ),),
            ),
            GroupButton(
                controller: controller,
                enableDeselect: true,
                options: GroupButtonOptions(
                  unselectedTextStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(128, 122, 122, 1)
                  ),
                  selectedTextStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: AppColors.primaryColor,
                  unselectedColor: Colors.white,
                  groupingType: GroupingType.wrap,
                  mainGroupAlignment: MainGroupAlignment.center,
                  unselectedBorderColor:const Color.fromRGBO(230, 230, 230, 1)
                ),
                buttons: const [
              "Today","Tomorrow","This week"
            ]),
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top: 14.h,bottom: 26.h),
              child: Container(
                height: 42.h,
                width: 250.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(230, 230, 230, 1),
                    width: 1
                  )
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 14.w),
                  child: GestureDetector(
                    onTap: () async{
                      final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendar,
                          firstDate: DateTime(2000),
                          lastDate:DateTime(3000)
                      );
                      setState(() {
                        date = dateTime;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_outlined,color: AppColors.primaryColor,size: 23,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          child: Text("Choose from calender",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(128, 122, 122, 1)
                          ),),
                        ),
                        Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 9,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w,bottom: 12.h),
              child: Text("Location",style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(18, 13, 38, 1)
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(229, 229, 229, 1),
                        width: 1
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w,right: 18.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.89),
                                color:const Color.fromRGBO(86, 105, 255, 0.15),
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(7.11),
                              child: IconButton(onPressed: (){},
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.19),
                                    ),
                                    fixedSize: Size(30.79.w, 30.79.h)
                                  ),
                                  icon: Icon(Icons.location_on_outlined,size: 15,color: AppColors.primaryColor,)),
                            )
                          ),
                          SizedBox(width: 18.w,),
                          Text("New Yourk, USA",style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(20, 23, 54, 1)
                          ),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,size: 9,color: AppColors.primaryColor,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select price range",style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(18, 13, 38, 1)
                  ),),
                  Text("\$${_values.start.round()}-\$${_values.end.round()}",style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(63, 56, 221, 1)
                  ),),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            SfRangeSlider(
                values: _values,
                activeColor: AppColors.primaryColor,
                max: 250,
                min: 0,
                stepSize: 10,
                startThumbIcon: Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_left_rounded,size: 8,color: Color.fromRGBO(94, 95, 101, 1),),
                      Icon(Icons.arrow_right,size: 8,color: Color.fromRGBO(94, 95, 101, 1),),
                    ],
                  ),
                ),
                endThumbIcon: Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_left_rounded,size: 8,color: Color.fromRGBO(94, 95, 101, 1),),
                      Icon(Icons.arrow_right,size: 8,color: Color.fromRGBO(94, 95, 101, 1),),
                    ],
                  ),
                ),
                interval: 10,
                inactiveColor: const Color.fromRGBO(86, 105, 255, 0.2),
                onChanged: (value) {
                  setState(() {
                    _values = value;
                  });
                },),
            SizedBox(height: 44.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(onPressed: (){
                      setState(() {
                        controller.unselectAll();
                        _values = const SfRangeValues(0, 250);
                      });
                      buttons.forEach((element) {
                        setState(() {
                          element['isSelected'] = false;
                        });
                      },);
                      selectedCategories.clear();
                    },
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromHeight(58.h),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: const BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              width: 1
                            )
                          )
                        ),
                        child: Text("Reset",style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(18, 13, 38, 1)
                        ),)),
                  ),
                  SizedBox(width: 19.w,),
                  Expanded(
                    child: TextButton(onPressed: (){
                      print(date);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return SearchPage(
                          categories: selectedCategories,
                          date: controller.selectedIndex,
                          location: '',
                          price1: _values.start.round(),
                          pickedDate: date,
                          price2: _values.end.round(),);
                      },));
                    },
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            fixedSize: Size.fromHeight(58.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: const BorderSide(
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                    width: 1
                                )
                            )
                        ),
                        child: Text("Apply",style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1)
                        ),)),
                  )
                ],
              ),
            ),
            SizedBox(height: 18.h,),
          ],
        ),
      ),
    );
  }
}
