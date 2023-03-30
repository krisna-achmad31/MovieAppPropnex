import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/controller/HomeController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatelessWidget {
  static const routedName = '/homePage';

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            'assets/img_bg_home.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRegularLancelot(
                      label: 'Welcome to Movie App',
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextRegularLancelot(
                      label: "Movie's Recommended",
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataRecommended.value
                        ? CarouselSlider(
                            carouselController: homeController.carouselController,
                            options: CarouselOptions(
                              viewportFraction: 0.7,
                              initialPage: 2,
                              aspectRatio: 2.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (position, reason) {},
                              enableInfiniteScroll: true,
                            ),
                            items: homeController.bannerImageDefault,
                          )
                        : CarouselSlider(
                            carouselController: homeController.carouselController,
                            options: CarouselOptions(
                              viewportFraction: 0.7,
                              initialPage: 2,
                              aspectRatio: 2.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (position, reason) {},
                              enableInfiniteScroll: true,
                            ),
                            items: homeController.bannerImage,
                          )),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularLancelot(
                          label: "Movie's Now Playing",
                          size: 20,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            // homeController.moveTolazy("Movie's Now Playing", '1');
                            homeController.moveToList("Movie's Now Playing", '1');
                          },
                          child: TextRegularExo(
                            label: 'View All...',
                            size: 12,
                            fontWeight: FontWeight.w800,
                            color: ProjectColors.projectColorThirdMainColor(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataNow.value
                        ? Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovieShimmer();
                              },
                              itemCount: 5,
                            ),
                          )
                        : Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovie(homeController.itemNowPlaying[index].posterPath!, homeController.itemNowPlaying[index].originalTitle!, homeController.itemNowPlaying[index].id!.toString(), 'Movie');
                              },
                              itemCount: homeController.itemPerPage,
                            ),
                          )),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularLancelot(
                          label: "Movie's Popular",
                          size: 20,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            homeController.moveToList("Movie's Popular", '2');
                          },
                          child: TextRegularExo(
                            label: 'View All...',
                            size: 12,
                            fontWeight: FontWeight.w800,
                            color: ProjectColors.projectColorThirdMainColor(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataPopular.value
                        ? Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovieShimmer();
                              },
                              itemCount: 5,
                            ),
                          )
                        : Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovie(homeController.itemPopular[index].posterPath!, homeController.itemPopular[index].originalTitle!, homeController.itemPopular[index].id!.toString(), 'Movie');
                              },
                              itemCount: homeController.itemPerPage,
                            ),
                          )),
                    SizedBox(
                      height: 24,
                    ),
                    TextRegularLancelot(
                      label: "Tv's Recommended",
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataRecommendedTv.value
                        ? CarouselSlider(
                            carouselController: homeController.carouselController,
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              initialPage: 2,
                              aspectRatio: 1.5,
                              autoPlay: true,
                              enlargeCenterPage: false,
                              onPageChanged: (position, reason) {},
                              enableInfiniteScroll: true,
                            ),
                            items: homeController.bannerImageDefaultTv,
                          )
                        : CarouselSlider(
                            carouselController: homeController.carouselController,
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              initialPage: 2,
                              aspectRatio: 1.5,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (position, reason) {},
                              enableInfiniteScroll: true,
                            ),
                            items: homeController.bannerImageTv,
                          )),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularLancelot(
                          label: "Tv's On The Air",
                          size: 20,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            homeController.moveToList("Tv's On The Air", '3');
                          },
                          child: TextRegularExo(
                            label: 'View All...',
                            size: 12,
                            fontWeight: FontWeight.w800,
                            color: ProjectColors.projectColorThirdMainColor(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataTvOnTheAir.value
                        ? Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovieShimmer();
                              },
                              itemCount: 5,
                            ),
                          )
                        : Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovie(homeController.itemTvOnTheAir[index].posterPath!, homeController.itemTvOnTheAir[index].name!, homeController.itemTvOnTheAir[index].id!.toString(), 'Tv');
                              },
                              itemCount: homeController.itemPerPage,
                            ),
                          )),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularLancelot(
                          label: "Tv's Popular",
                          size: 20,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            homeController.moveToList("Tv's Popular", '4');
                          },
                          child: TextRegularExo(
                            label: 'View All...',
                            size: 12,
                            fontWeight: FontWeight.w800,
                            color: ProjectColors.projectColorThirdMainColor(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => homeController.loadingDataTvPopular.value
                        ? Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovieShimmer();
                              },
                              itemCount: 5,
                            ),
                          )
                        : Container(
                            height: 243,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return _itemMovie(homeController.itemTvPopular[index].posterPath!, homeController.itemTvPopular[index].name!, homeController.itemTvPopular[index].id!.toString(), 'Tv');
                              },
                              itemCount: homeController.itemPerPage,
                            ),
                          )),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _itemMovie(String picture, String tittle, String id, String cat) {
    return Row(children: [
      InkWell(
        onTap: () {
          homeController.moveToDetail(id, cat);
        },
        child: Stack(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(width: 150, height: 243, borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              width: 150,
              height: 243,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/$picture'),
                  )),
            )
          ],
        ),
      ),
      SizedBox(
        width: 16,
      )
    ]);
  }

  Widget _itemMovieShimmer() {
    return Row(children: [
      SkeletonAvatar(
        style: SkeletonAvatarStyle(width: 150, height: 243),
      ),
      SizedBox(
        width: 16,
      )
    ]);
  }

  Widget _itemRecommendedTv(String image, String id, String title) {
    return Container(
      width: double.infinity,
      height: 239,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 239,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/$image'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              height: 239,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    TextRegularExo(
                      label: '$title',
                      size: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
