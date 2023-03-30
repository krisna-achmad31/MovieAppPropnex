import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/controller/MainPageController.dart';
import 'package:PropnexTestApp/pages/HomePage.dart';
import 'package:PropnexTestApp/pages/SearchPage.dart';
import 'package:PropnexTestApp/pages/TrendingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../animation/animationBottomBar.dart';
import '../components/text.dart';

class MainPage extends StatelessWidget {
  static const routedName = '/mainPage';

  MainPageController mainPageController = Get.find();

  buildBottomNavigationMenu(context, MainPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: SizedBox(
          child: BottomNavigationBar(
            backgroundColor: ProjectColors.projectColorMainColor(),
            elevation: 0,
            showUnselectedLabels: true,
            onTap: mainPageController.changeTabIndex,
            currentIndex: mainPageController.children.value,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(color: mainPageController.children.value == 0 ? ProjectColors.projectColorSecondMainColor() : Colors.transparent, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 24, height: 24, child: mainPageController.children.value == 0 ? Image.asset('assets/ic_home_bar_on.png') : Image.asset('assets/ic_home_bar.png')),
                            SizedBox(
                              width: 8,
                            ),
                            TextRegularExo(
                              label: mainPageController.children.value == 0 ? 'Home' : '',
                              fontWeight: mainPageController.children.value == 0 ? FontWeight.w800 : null,
                              color: mainPageController.children.value == 0 ? ProjectColors.projectColorThirdMainColor() : Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(color: mainPageController.children.value == 1 ? ProjectColors.projectColorSecondMainColor() : Colors.transparent, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 24, height: 24, child: mainPageController.children.value == 1 ? Image.asset('assets/ic_search_bar_on.png') : Image.asset('assets/ic_search_bar.png')),
                            SizedBox(
                              width: 8,
                            ),
                            mainPageController.children.value == 1
                                ? TextRegularExo(
                                    label: mainPageController.children.value == 1 ? 'Seacrh' : '',
                                    fontWeight: mainPageController.children.value == 1 ? FontWeight.w800 : null,
                                    color: mainPageController.children.value == 1 ? ProjectColors.projectColorThirdMainColor() : Colors.white,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(color: mainPageController.children.value == 2 ? ProjectColors.projectColorSecondMainColor() : Colors.transparent, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 24, height: 24, child: mainPageController.children.value == 2 ? Image.asset('assets/ic_search_bar_on.png') : Image.asset('assets/ic_search_bar.png')),
                            SizedBox(
                              width: 8,
                            ),
                            TextRegularExo(
                              label: mainPageController.children.value == 2 ? 'Seacrh' : '',
                              fontWeight: mainPageController.children.value == 2 ? FontWeight.w800 : null,
                              color: mainPageController.children.value == 2 ? ProjectColors.projectColorThirdMainColor() : Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  label: ''),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final MainPageController mainPageController = Get.put(MainPageController(), permanent: false);
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          bottomNavigationBar: _buildBottomBar(context, mainPageController),
          body: Obx(() => IndexedStack(
                index: mainPageController.children.value,
                children: [HomePage(), TrendingPage(), SearchPage()],
              )),
        ),
        Visibility(
          visible: !mainPageController.isNetworkOnline.value,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(color: ProjectColors.projectColorMainColor(), borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildBottomBar(context, MainPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: SizedBox(
          child: CustomAnimatedBottomBar(
            containerHeight: 50,
            backgroundColor: ProjectColors.projectColorMainColor(),
            selectedIndex: mainPageController.children.value,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: mainPageController.changeTabIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: ImageIcon(AssetImage(
                  "assets/ic_home_bar.png",
                )),
                title: Text('Home'),
                activeColor: ProjectColors.projectColorThirdMainColor(),
                inactiveColor: ProjectColors.projectColorWhite(),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: ImageIcon(AssetImage(
                  "assets/ic_trending.png",
                )),
                title: Text('Trending'),
                activeColor: ProjectColors.projectColorThirdMainColor(),
                inactiveColor: ProjectColors.projectColorWhite(),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: ImageIcon(AssetImage(
                  "assets/ic_search_bar.png",
                )),
                title: Text(
                  'Search ',
                ),
                activeColor: ProjectColors.projectColorThirdMainColor(),
                inactiveColor: ProjectColors.projectColorWhite(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
