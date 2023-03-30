import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/controller/SearchController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletons/skeletons.dart';

class SearchPage extends StatelessWidget {
  static const routedName = '/searchPage';

  SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ProjectColors.projectColorSecondMainColor(),
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    WhiteOutlinedTextField(
                      controller: searchController.keyword,
                      autofocus: false,
                      function: searchController.focusNode,
                      hintText: 'Search movie here...',
                      maxLines: 1,
                      functionMove: (value) {
                        searchController.searchMovie(value);
                      },
                    )
                  ],
                ),
              ),
              Obx(
                () => searchController.loadingData.value
                    ? ListView(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        children: List.generate(8, (index) {
                          return _shimmerItem();
                        }),
                      )
                    : searchController.empty.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 64, right: 64, top: 64, bottom: 32), child: Image.asset('assets/ic_empty_state.png')),
                              TextRegularExo(
                                label: 'Result Not Found',
                                color: Colors.white,
                                size: 28,
                                fontWeight: FontWeight.w800,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: TextRegularExo(
                                  label: 'Please try again with another keywords',
                                  color: Colors.white,
                                  size: 18,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: List.generate(searchController.movieResult.length, (index) {
                                  return _itemMovie(searchController.movieResult[index].posterPath != null ? searchController.movieResult[index].posterPath : '', searchController.movieResult[index].title!, searchController.movieResult[index].releaseDate!,
                                      searchController.movieResult[index].id!.toString(), 'Movie');
                                }),
                                addAutomaticKeepAlives: true,
                                cacheExtent: double.infinity,
                              ),
                              ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: List.generate(searchController.tvResult.length, (index) {
                                  return _itemMovie(searchController.tvResult[index].posterPath != null ? searchController.tvResult[index].posterPath! : '', searchController.tvResult[index].name!, searchController.tvResult[index].firstAirDate!, searchController.tvResult[index].id!.toString(), 'Tv');
                                }),
                                addAutomaticKeepAlives: true,
                                cacheExtent: double.infinity,
                              )
                            ],
                          ),
              )
            ],
          ),
        ]),
      ),
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
                                    searchController.moveToDetail(id, cat);
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
              // Container(
              //   height: 122,
              //   width: 82,
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: NetworkImage('https://image.tmdb.org/t/p/w500/$picture'),
              //   )),
              // ),
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
