import 'package:event_app/src/models/eventimages.dart';
import 'package:event_app/src/models/eventmodel.dart';
import 'package:event_app/src/services/event/eventservices.dart';
import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/views/nav/navpage.dart';
import 'package:event_app/src/widgets/filterpage.dart';
import 'package:event_app/src/widgets/searcheventcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchPage extends StatefulWidget {
  final List<String>? categories;
  final int? date;
  final DateTime? pickedDate;
  final String? location;
  final int? price1;
  final int? price2;
  const SearchPage({super.key, this.categories, this.date, this.pickedDate, this.location, this.price1, this.price2});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

DateTime now = DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);
DateTime tomorrow = today.add(const Duration(days: 1));
DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));


class _SearchPageState extends State<SearchPage> {
  List<EventModel> _allEvents = [];
  List<EventModel> _filterEvents = [];


  Future<void> _fetchAllEvents() async{
    try{

      final List<EventModel> events = await EventService().getEvents();
      setState(() {
        _allEvents = events;
        if(widget.categories!.isEmpty && widget.price1 == 0 && widget.price2 == 250 && widget.location == null && widget.date == null && widget.pickedDate == null){
        _filterEvents = events;}
        else if(widget.categories!.isNotEmpty && widget.price1 == null && widget.price2 == null&& widget.location == null && widget.date == null && widget.pickedDate == null){
          _filterEvents = events.where((element) {
            return widget.categories!.any((category) =>element.category.contains(category) ,);
          },).toList();
        }
        else if(widget.categories!.isEmpty && widget.price1 == null && widget.price2 == null && widget.location == null && widget.date == null && widget.pickedDate == null){
          _filterEvents = events;}
        else if(widget.categories!.isNotEmpty){
            if(widget.location !=""){
              if(widget.date != null){
                if(widget.date == 0){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAtSameMomentAs(today) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.date == 1){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAtSameMomentAs(tomorrow) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.date == 3){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                        element.date.isBefore(endOfWeek.add(const Duration(days: 1))) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
              }
              else if(widget.date == null){
                if(widget.pickedDate != null){
                  DateTime? startOfDay = DateTime(widget.pickedDate!.year, widget.pickedDate!.month, widget.pickedDate!.day);
                  DateTime? endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(seconds: 1));
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAfter(startOfDay) && element.date.isBefore(endOfDay) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.pickedDate == null){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
              }
            }
            else if(widget.location ==""){
              if(widget.date != null){
                if(widget.date == 0){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAtSameMomentAs(today) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.date == 1){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAtSameMomentAs(tomorrow) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.date == 3){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                        element.date.isBefore(endOfWeek.add(const Duration(days: 1))) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
              }
              else if(widget.date == null){
                if(widget.pickedDate != null){
                  DateTime? startOfDay = DateTime(widget.pickedDate!.year, widget.pickedDate!.month, widget.pickedDate!.day);
                  DateTime? endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(seconds: 1));
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAfter(startOfDay) && element.date.isBefore(endOfDay) &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
                else if(widget.pickedDate == null){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! &&  widget.categories!.any((category) =>element.category.contains(category) ,);
                  },).toList();
                }
              }
            }
            }
        else if(widget.categories!.isEmpty){
            if(widget.location !=""){
              if(widget.date != null){
                if(widget.date == 0){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAtSameMomentAs(today);
                  },).toList();
                }
                else if(widget.date == 1){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAtSameMomentAs(tomorrow) ;
                  },).toList();
                }
                else if(widget.date == 3){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                        element.date.isBefore(endOfWeek.add(const Duration(days: 1))) ;
                  },).toList();
                }
              }
              else if(widget.date == null){
                if(widget.pickedDate != null){
                  DateTime? startOfDay = DateTime(widget.pickedDate!.year, widget.pickedDate!.month, widget.pickedDate!.day);
                  DateTime? endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(seconds: 1));
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location && element.date.isAfter(startOfDay) && element.date.isBefore(endOfDay);
                  },).toList();
                }
                else if(widget.pickedDate == null){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.venue == widget.location ;
                  },).toList();
                }
              }
            }
            else if(widget.location ==""){
              if(widget.date != null){
                if(widget.date == 0){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAtSameMomentAs(today) ;
                  },).toList();
                }
                else if(widget.date == 1){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAtSameMomentAs(tomorrow) ;
                  },).toList();
                }
                else if(widget.date == 3){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                        element.date.isBefore(endOfWeek.add(const Duration(days: 1)));
                  },).toList();
                }
              }
              else if(widget.date == null){
                if(widget.pickedDate != null){
                  DateTime? startOfDay = DateTime(widget.pickedDate!.year, widget.pickedDate!.month, widget.pickedDate!.day);
                  DateTime? endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(seconds: 1));
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! && element.date.isAfter(startOfDay) && element.date.isBefore(endOfDay) ;
                  },).toList();
                }
                else if(widget.pickedDate == null){
                  _filterEvents = events.where((element) {
                    return element.price <= widget.price2! && element.price >= widget.price1! ;
                  },).toList();
                }
              }
            }
          }
      });

    }catch(error){
      print("Error : $error");
    }
  }


  void _searchEvents(String query){
    setState(() {
      _filterEvents = _allEvents.where((event) => event.title.toLowerCase().contains(query.toLowerCase()),).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAllEvents();
    // _filterCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
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
        }, icon: const Icon(Icons.arrow_back)),
        title: Text("Search",style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(18, 13, 38, 1)
        ),),
        titleSpacing: 11,
      ),
      body:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/search.svg",color:AppColors.primaryColor),
                        SizedBox(width: 10.w,),
                        Container(
                          width: 1.w,
                          height: 32.h,
                          decoration: const BoxDecoration(
                              border: Border(left: BorderSide(
                                  color: Color.fromRGBO(121, 116, 231, 1),
                                  width: 1
                              ))
                          ),),
                        SizedBox(
                          width: 180.w,
                          height: 33.h,
                          child: TextField(
                            onChanged: _searchEvents,
                            decoration: InputDecoration(
                                hintText: "Search...",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24.sp,
                                    color:const Color.fromRGBO(0, 0, 0, 0.3)
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showBarModalBottomSheet(context: context, builder: (context) {
                          return const FilterPage();
                        },);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/Vector.svg"),
                              SizedBox(width: 4.w,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Text("Filters",style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color:const Color.fromRGBO(236, 235, 252, 1)
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 29.h,),
                _filterEvents.isEmpty? const Center(
                  child: Text("No Events"),
                ):Expanded(
                    child:ListView.builder(
                      shrinkWrap: true,
                      itemCount:  _filterEvents.length,itemBuilder: (context, index) {
                      EventModel event = _filterEvents[index];
                      return Padding(
                        padding:EdgeInsets.symmetric(vertical: 8.h),
                        child:  SearchEventCard(id: event.eventId, image: EventImages().eventImages[index],),
                      );
                    },) ),
              ],
            ),
          )
    );
  }
}
