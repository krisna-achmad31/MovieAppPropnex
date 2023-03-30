import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/controller/TrendingController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TrendingPage extends StatelessWidget {
  static const routedName = '/trendingPage';

  TrendingController trendingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectColorMainColor(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Obx(
              () => trendingController.loading.value
                  ? Container()
                  : GetBuilder(
                      init: trendingController,
                      builder: (value) => Image.network(
                        'https://image.tmdb.org/t/p/w500/${trendingController.itemRecommendationTv[trendingController.current.value].posterPath}',
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                            ),
                          );
                        },
                      ),
                    ),
            ),
            // Image.network('https://image.tmdb.org/t/p/w500/${trendingController.itemRecommendationTv[trendingController.current.value].posterPath}', fit: BoxFit.cover),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                  ProjectColors.projectColorMainColor().withOpacity(1),
                  ProjectColors.projectColorMainColor().withOpacity(1),
                  ProjectColors.projectColorMainColor().withOpacity(1),
                  ProjectColors.projectColorMainColor().withOpacity(1),
                  ProjectColors.projectColorMainColor().withOpacity(0.0),
                  ProjectColors.projectColorMainColor().withOpacity(0.0),
                  ProjectColors.projectColorMainColor().withOpacity(0.0),
                  ProjectColors.projectColorMainColor().withOpacity(0.0),
                ])),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    print(trendingController.itemRecommendationTv[index].posterPath);
                    trendingController.reload(index);
                    trendingController.current = index.obs;
                    trendingController.loading(false);
                  },
                ),
                carouselController: trendingController.carouselController,
                items: trendingController.bannerImageTv,
              ),
            )
          ],
        ),
      ),
    );
  }
}
