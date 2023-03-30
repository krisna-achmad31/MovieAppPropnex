import 'package:PropnexTestApp/controller/CheckConnectionController.dart';
import 'package:PropnexTestApp/controller/DetailPageController.dart';
import 'package:PropnexTestApp/controller/HomeController.dart';
import 'package:PropnexTestApp/controller/ListPageController.dart';
import 'package:PropnexTestApp/controller/MainPageController.dart';
import 'package:PropnexTestApp/controller/SearchController.dart';
import 'package:PropnexTestApp/controller/TrendingController.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPageController>(() => DetailPageController(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
    Get.lazyPut<ListPageController>(() => ListPageController(), fenix: true);
    Get.lazyPut<CheckConnectionStream>(() => CheckConnectionStream(), fenix: true);
    Get.lazyPut<MainPageController>(() => MainPageController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<TrendingController>(() => TrendingController(), fenix: true);
  }
}
