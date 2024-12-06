import 'package:event_app/src/utils/appcolors.dart';
import 'package:event_app/src/widgets/categorycard.dart';
import 'package:event_app/src/widgets/mapcategorycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: const BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ OSMFlutter(
            mapIsLoading: const Center(child: CircularProgressIndicator()),
            controller: controller,
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: const ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
              ),
              showZoomController: true,
              roadConfiguration: const RoadOption(
                roadColor: Colors.yellowAccent,
              ),
            )),
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 38.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 51.h,
                              width: 252.w,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none
                                  ),
                                  prefixIcon: const Icon(Icons.arrow_back_ios_new,color: Color.fromRGBO(17, 23, 25, 1),size: 12,),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Find for food or restaurant...",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(97, 102, 121, 0.5)
                                  )
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){},
                                style: IconButton.styleFrom(
                                  fixedSize: Size(51.w, 51.h),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(12),
                                  )
                                ),
                                icon: Icon(Icons.my_location,color: AppColors.primaryColor,size: 22,))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.w,top: 20.h),
                        child: SizedBox(
                          height: 42.h,
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(
                            child: ListView.builder(itemCount: 10,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                              return const MapCategoryCard();
                            },),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 25.w,right: 25.w,bottom: 110.h),
                    child: Container(
                      height: 106.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(73, 62, 131, 0.12),
                            offset:Offset(0, 16),
                            blurRadius: 32,
                            spreadRadius: 0
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left: 9.w,top: 7.h,bottom: 7.h),
                            child: Container(
                              height: 92.h,
                              width: 72.w,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(image: AssetImage("assets/images/image 84.png"),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 14.89.w,),
                            child: SizedBox(
                              width: 207.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Wed, Apr 28 •5:30 PM",style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor
                                      ),),
                                      const Icon(Icons.bookmark,color:Color.fromRGBO(235, 87, 87, 1),size: 16,)
                                    ],
                                  ),
                                  Text("Jo Malone London’s Mother’s Day Presents",style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color:const Color.fromRGBO(18, 13, 38, 1)
                                  ),),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,color: Color.fromRGBO(113, 110, 144, 0.6),size: 16,),
                                      SizedBox(width: 6.w,),
                                      Expanded(
                                        child: Text("Radius Gallery • Santa Cruz, CA",style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(116, 118, 136, 1)
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
