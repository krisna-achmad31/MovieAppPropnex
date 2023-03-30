import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/header.dart';
import 'package:PropnexTestApp/controller/ListPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:skeletons/skeletons.dart';

import '../components/text.dart';

class ListPage extends StatelessWidget {
  static const routedName = '/listlPage';

  ListPageController listPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectColorMainColor(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Get.back();
              },
              icon: ImageIcon(AssetImage(
                "assets/ic_back.png",
              )),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: ProjectColors.projectColorSecondMainColor(),
        title: Text(
          listPageController.titlePage,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Exo', color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          listPageController.total == 0
              ? listPageController.cat == 1.toString()
                  ? Obx(
                      () => LazyLoadScrollView(
                          isLoading: listPageController.lastPage.value,
                          child: ListView.builder(
                              itemCount: listPageController.itemNowPlaying.length,
                              itemBuilder: (context, index) {
                                return _itemMovie(
                                  listPageController.itemNowPlaying[index].posterPath != null ? listPageController.itemNowPlaying[index].posterPath! : '',
                                  listPageController.itemNowPlaying[index].title!,
                                  listPageController.itemNowPlaying[index].releaseDate!,
                                  listPageController.itemNowPlaying[index].id!.toString(),
                                  'Movie',
                                );
                              }),
                          onEndOfPage: () {
                            listPageController.getNowPlaying();
                          }),
                    )
                  : listPageController.cat == 2.toString()
                      ? Obx(
                          () => LazyLoadScrollView(
                              isLoading: listPageController.lastPage.value,
                              child: ListView.builder(
                                  itemCount: listPageController.itemPopular.length,
                                  itemBuilder: (context, index) {
                                    return _itemMovie(
                                      listPageController.itemPopular[index].posterPath != null ? listPageController.itemPopular[index].posterPath! : '',
                                      listPageController.itemPopular[index].title!,
                                      listPageController.itemPopular[index].releaseDate!,
                                      listPageController.itemPopular[index].id!.toString(),
                                      'Movie',
                                    );
                                  }),
                              onEndOfPage: () {
                                listPageController.getPopular();
                              }),
                        )
                      : listPageController.cat == 3.toString()
                          ? Obx(
                              () => LazyLoadScrollView(
                                  isLoading: listPageController.lastPage.value,
                                  child: ListView.builder(
                                      itemCount: listPageController.itemTvOnTheAir.length,
                                      itemBuilder: (context, index) {
                                        return _itemMovie(
                                          listPageController.itemTvOnTheAir[index].posterPath != null ? listPageController.itemTvOnTheAir[index].posterPath! : '',
                                          listPageController.itemTvOnTheAir[index].name!,
                                          listPageController.itemTvOnTheAir[index].firstAirDate!,
                                          listPageController.itemTvOnTheAir[index].id!.toString(),
                                          'Movie',
                                        );
                                      }),
                                  onEndOfPage: () {
                                    listPageController.getTvOnTheAir();
                                  }),
                            )
                          : Obx(
                              () => LazyLoadScrollView(
                                  isLoading: listPageController.lastPage.value,
                                  child: ListView.builder(
                                      itemCount: listPageController.itemTvPopular.length,
                                      itemBuilder: (context, index) {
                                        return _itemMovie(
                                          listPageController.itemTvPopular[index].posterPath != null ? listPageController.itemTvPopular[index].posterPath! : '',
                                          listPageController.itemTvPopular[index].name!,
                                          listPageController.itemTvPopular[index].firstAirDate!,
                                          listPageController.itemTvPopular[index].id!.toString(),
                                          'Movie',
                                        );
                                      }),
                                  onEndOfPage: () {
                                    listPageController.getTvPopular();
                                  }),
                            )
              : Obx(
                  () => listPageController.first.value
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 64, right: 64, top: 64, bottom: 32), child: Image.asset('assets/ic_empty_state.png')),
                            TextRegularExo(
                              label: 'Not Found',
                              color: Colors.white,
                              size: 28,
                              fontWeight: FontWeight.w800,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: TextRegularExo(
                                label: 'Please try again with another playlist',
                                color: Colors.white,
                                size: 18,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                ),
          Obx(
            () => listPageController.loadingDataNow.value
                ? listPageController.first.value
                    ? ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return _shimmerItem();
                        })
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ProjectColors.projectColorWhite().withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: MediaQuery.of(context).size.height * 0.3,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                              SpinKitCircle(
                                color: ProjectColors.projectColorThirdMainColor(),
                                size: 80,
                              ),
                              Divider(
                                height: 4,
                                thickness: 2,
                              ),
                              TextRegularExo(
                                label: 'Loading',
                                size: 32,
                              )
                            ]),
                          ),
                        ),
                      )
                : Container(),
          ),
        ]),
      ),

      // SafeArea(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView(
      //           shrinkWrap: true,
      //           physics: ClampingScrollPhysics(),
      //           children: [
      //             Obx(
      //               () => listPageController.loadingDataNow.value
      //                   ? ListView(
      //                       shrinkWrap: true,
      //                       physics: ClampingScrollPhysics(),
      //                       children: List.generate(8, (index) {
      //                         return _shimmerItem();
      //                       }),
      //                     )
      //                   : listPageController.total == 0
      //                       ? Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Padding(padding: EdgeInsets.only(left: 64, right: 64, top: 64, bottom: 32), child: Image.asset('assets/ic_empty_state.png')),
      //                             TextRegularExo(
      //                               label: 'Not Found',
      //                               color: Colors.white,
      //                               size: 28,
      //                               fontWeight: FontWeight.w800,
      //                             ),
      //                             Padding(
      //                               padding: EdgeInsets.all(16),
      //                               child: TextRegularExo(
      //                                 label: 'Please try again with another playlist',
      //                                 color: Colors.white,
      //                                 size: 18,
      //                                 textAlign: TextAlign.center,
      //                               ),
      //                             ),
      //                           ],
      //                         )
      //                       : listPageController.cat == 1.toString()
      //                           ? ListView(
      //                               shrinkWrap: true,
      //                               physics: ClampingScrollPhysics(),
      //                               children: List.generate(listPageController.itemNowPlaying.length, (index) {
      //                                 return _itemMovie(listPageController.itemNowPlaying[index].posterPath != null ? listPageController.itemNowPlaying[index].posterPath! : '', listPageController.itemNowPlaying[index].title!, listPageController.itemNowPlaying[index].releaseDate!,
      //                                     listPageController.itemNowPlaying[index].id!.toString(), 'Movie');
      //                               }),
      //                             )
      //                           : listPageController.cat == 2.toString()
      //                               ? ListView(
      //                                   shrinkWrap: true,
      //                                   physics: ClampingScrollPhysics(),
      //                                   children: List.generate(15, (index) {
      //                                     return _itemMovie(listPageController.itemPopular[index].posterPath != null ? listPageController.itemPopular[index].posterPath! : '', listPageController.itemPopular[index].title!, listPageController.itemPopular[index].releaseDate!,
      //                                         listPageController.itemPopular[index].id!.toString(), 'Movie');
      //                                   }),
      //                                 )
      //                               : listPageController.cat == 3.toString()
      //                                   ? ListView(
      //                                       shrinkWrap: true,
      //                                       physics: ClampingScrollPhysics(),
      //                                       children: List.generate(15, (index) {
      //                                         return _itemMovie(listPageController.itemTvOnTheAir[index].posterPath != null ? listPageController.itemTvOnTheAir[index].posterPath! : '', listPageController.itemTvOnTheAir[index].name!, listPageController.itemTvOnTheAir[index].firstAirDate!,
      //                                             listPageController.itemTvOnTheAir[index].id!.toString(), 'Tv');
      //                                       }),
      //                                     )
      //                                   : ListView(
      //                                       shrinkWrap: true,
      //                                       physics: ClampingScrollPhysics(),
      //                                       children: List.generate(15, (index) {
      //                                         return _itemMovie(listPageController.itemTvPopular[index].posterPath != null ? listPageController.itemTvPopular[index].posterPath! : '', listPageController.itemTvPopular[index].name!, listPageController.itemTvPopular[index].firstAirDate!,
      //                                             listPageController.itemTvPopular[index].id!.toString(), 'Tv');
      //                                       }),
      //                                     ),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Widget _itemMovie(String picture, String tittle, String year, String id, String cat) {
    return Column(
      children: [
        Container(
          height: 154,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                picture == ''
                    ? Container(
                        height: 122,
                        width: 82,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img_splash.png'),
                            )),
                      )
                    : Container(
                        height: 122,
                        width: 82,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://image.tmdb.org/t/p/w500/$picture'),
                            )),
                      ),
                Flexible(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegularLancelot(
                                label: tittle,
                                color: Colors.white,
                                size: 20,
                                maxLine: 2,
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  TextRegularExo(
                                    label: '2019',
                                    color: Colors.white,
                                  ),
                                  TextRegularExo(
                                    label: ' | ',
                                    color: Colors.white,
                                  ),
                                  TextRegularExo(
                                    label: year,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 107,
                            height: 26,
                            child: Stack(
                              children: [
                                GlowButton(
                                  onPressed: () {
                                    listPageController.moveToDetail(id, cat);
                                  },
                                  child: TextRegularExo(
                                    label: 'Detail',
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: double.infinity, child: Image.asset('assets/img_divider.png'))
      ],
    );
  }

  Widget _shimmerItem() {
    return Column(children: [
      Container(
        height: 154,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 82, height: 122),
              ),
              Flexible(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonLine(style: SkeletonLineStyle(height: 32, width: double.infinity)),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                SkeletonLine(style: SkeletonLineStyle(height: 20, width: 34)),
                                TextRegularExo(
                                  label: ' | ',
                                  color: Colors.white,
                                ),
                                SkeletonLine(style: SkeletonLineStyle(height: 20, width: 34)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 107,
                          height: 26,
                          child: Stack(
                            children: [
                              SkeletonLine(style: SkeletonLineStyle(height: 28, width: 85)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(width: double.infinity, child: Image.asset('assets/img_divider.png'))
    ]);
  }
}
