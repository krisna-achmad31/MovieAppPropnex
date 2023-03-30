import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/controller/DetailPageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const routedName = '/detailPage';

  DetailPageController detailPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectColorMainColor(),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/img_bg_home.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Obx(() => detailPageController.loadingData.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : FadeIn(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/${detailPageController.background}'), fit: BoxFit.cover)),
                    ),
                  )),
            Positioned(bottom: 0, child: Image.asset('assets/img_gradient_details.png')),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification notification) {
                print(notification.extent);
                detailPageController.position = notification.extent.obs.toString();
                return true;
              },
              child: FadeInUp(child: infoMovie()),
            ),
            // FadeInUp(child: infoMovie()),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 32),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: Image.asset('assets/ic_back.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoMovie() {
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(16),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img_bg_home.png'), fit: BoxFit.fill), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          decoration: BoxDecoration(color: ProjectColors.projectColorWhite().withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => detailPageController.loadingData.value
                        ? Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FadeInUp(
                                      child: Container(
                                        width: 140,
                                        height: 200,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/${detailPageController.poster}'), fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FadeInUp(
                                            child: TextRegularExo(
                                              label: detailPageController.tittle,
                                              color: Colors.white,
                                              size: 24,
                                              fontWeight: FontWeight.w800,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          FadeInUp(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                TextRegularExo(
                                                  label: detailPageController.genre,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                TextRegularExo(
                                                  label: detailPageController.language,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                TextRegularExo(
                                                  label: detailPageController.year,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                      child: Image.asset('assets/ic_stars.png'),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    TextRegularExo(
                                                      label: '${detailPageController.rating} / 10',
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                      child: Image.asset('assets/ic_voters.png'),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    TextRegularExo(
                                                      label: '${detailPageController.voter}',
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                FadeInUp(
                                  child: TextRegularExo(
                                    label: 'Summary',
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FadeInUp(
                                  child: TextRegularExo(
                                    label: detailPageController.summary,
                                    color: Colors.white,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                FadeInUp(
                                  child: TextRegularExo(
                                    label: 'Homepage',
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                FadeInUp(
                                  child: InkWell(
                                    onTap: () {
                                      detailPageController.openLink('https://pub.dev/packages/flutter_linkify');
                                    },
                                    child: TextRegularExo(
                                      label: detailPageController.homepage,
                                      color: Colors.white,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                FadeInUp(
                                  child: TextRegularExo(
                                    label: 'More Like This',
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Obx(() => detailPageController.loadingData.value
                                    ? FadeInUp(
                                        child: Container(
                                          height: 243,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return _itemMovieShimmer();
                                            },
                                            itemCount: 5,
                                          ),
                                        ),
                                      )
                                    : detailPageController.cat == 'Movie'
                                        ? Container(
                                            height: 243,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context, int index) {
                                                return _itemMovie(detailPageController.movieResult[index].posterPath!, detailPageController.movieResult[index].originalTitle!, detailPageController.movieResult[index].id!.toString(), 'Movie');
                                              },
                                              itemCount: detailPageController.itemPerPage,
                                            ),
                                          )
                                        : Container(
                                            height: 243,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context, int index) {
                                                return _itemMovie(detailPageController.tvResult[index].posterPath!, detailPageController.tvResult[index].name!, detailPageController.tvResult[index].id!.toString(), 'Tv');
                                              },
                                              itemCount: detailPageController.itemPerPage,
                                            ),
                                          )),
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _itemMovie(String picture, String tittle, String id, String cat) {
    return Row(children: [
      InkWell(
        onTap: () {
          detailPageController.getInfoMovie(id);
        },
        child: Stack(
          children: [
            picture == ' '
                ? Container()
                : SkeletonAvatar(
                    style: SkeletonAvatarStyle(width: 150, height: 243, borderRadius: BorderRadius.circular(10)),
                  ),
            picture == ' '
                ? Container(
                    height: 243,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img_splash.png'),
                        )),
                  )
                : Container(
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
}
