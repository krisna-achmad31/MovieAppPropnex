

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PropnexTestApp/models/recommendationTv/RecommendationTvResponse.dart' as recommendationTv;

import '../pages/DetailPage.dart';
import '../repository/MovieRepository.dart';
import 'CheckConnectionController.dart';

class TrendingController extends GetxController {

  CarouselController carouselController = new CarouselController();

  var loading = false.obs;

  var loadingDataRecommendedTv = false.obs;

  var current = 0.obs;

  List<Widget> bannerImageTv = [];
  List<recommendationTv.Results> itemRecommendationTv = [];

  CheckConnectionStream checkConnectionStream = CheckConnectionStream();


  @override
  void onInit() {
    initCheckConnection();
    getRecommendedTv();
    super.onInit();
  }

  void initCheckConnection() {
    checkConnectionStream.initConnectivity();
    checkConnectionStream.connectivitySubscription = checkConnectionStream.connectivity.onConnectivityChanged.listen(checkConnectionStream.updateConnectionStatus);
  }

  @override
  void onClose() {
    checkConnectionStream.connectivitySubscription.cancel();
    super.onClose();
  }

  void getRecommendedTv() async {
    loadingDataRecommendedTv(false);
    try{
      recommendationTv.RecommendationTvResponse recommendationTvResponse = await MovieRepository().getRecommendationTv();
      itemRecommendationTv = recommendationTvResponse.results!;
      bannerImageTv = recommendationTvResponse.results!.map((e) {
        print(bannerImageTv.length);
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: (){
                moveToDetail(e.id.toString(),'Tv');
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 320,
                          margin: EdgeInsets.only(top: 30),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network('https://image.tmdb.org/t/p/w500/${e.posterPath!}', fit: BoxFit.cover),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text(e.name!, style:
                          TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        // rating
                        SizedBox(height: 20),
                        Container(
                          child: Text(e.overview!, style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.shade600
                          ), textAlign: TextAlign.center, maxLines: 1,
                          ),
                        ),
                        SizedBox(height: 20),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: 1.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow, size: 20,),
                                      SizedBox(width: 5),
                                      Text(e.voteAverage.toString(), style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600
                                      ),)
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.access_time, color: Colors.grey.shade600, size: 20,),
                                      SizedBox(width: 5),
                                      Text(e.firstAirDate.toString().substring(0,4), style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600
                                      ),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_circle_filled, color: Colors.grey.shade600, size: 20,),
                                      SizedBox(width: 5),
                                      Text('Watch', style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600
                                      ),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            );
          },
        );
      }).toList();
      notifyChildrens();
      await loadingDataRecommendedTv(false);
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  Future<void> reload(int index) async {
    loading(true);
    print(itemRecommendationTv[index].posterPath);
    try{
      if(itemRecommendationTv[index].posterPath != " "){
        loading(false);
      }
    }catch(e){

    }
  }

  void moveToDetail(String id, String cat) {
    Get.toNamed(DetailPage.routedName, arguments: [
      {'id': '$id'},
      {'cat': '$cat'},
    ]);
  }
}