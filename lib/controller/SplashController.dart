import 'dart:async';

import 'package:PropnexTestApp/components/colors.dart';
import 'package:PropnexTestApp/components/text.dart';
import 'package:PropnexTestApp/controller/CheckConnectionController.dart';
import 'package:PropnexTestApp/pages/MainPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  CheckConnectionStream checkConnectionStream = CheckConnectionStream();

  bool isModalEnable = false;
  final loadingCheckConnectivity = false.obs;

  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    connectivitySubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();

      loadingCheckConnectivity.value = false;
    } on PlatformException {
      return;
    }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;

    if (result == ConnectivityResult.none) {
      if (isModalEnable != true) {
        isModalEnable = true;
        showDialogIfNotConnect();
        print('a');
      }
    } else {
      if (isModalEnable) {
        Get.back();
        next();
      }
      isModalEnable = false;
      next();
    }
  }

  showDialogIfNotConnect() {
    Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          return false;
        },
        title: '',
        titlePadding: EdgeInsets.zero,
        content: Stack(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(left: 32, right: 32), child: Image.asset('assets/ic_disconect.png')),
                TextRegularExo(
                  label: 'Lost Connection',
                  size: 28,
                  fontWeight: FontWeight.w800,
                ),
                TextRegularExo(
                  label: 'Whoops, no internet connection found. Please check your connection',
                  size: 18,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset('assets/ic_exit.png'),
                    ),
                  ),
                ))
          ],
        ),
        titleStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        middleTextStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        radius: 30,
        actions: [
          Obx(() => loadingCheckConnectivity.value
              ? SizedBox(
                  height: 48,
                  width: 48,
                  child: const CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    loadingCheckConnectivity.value = true;
                    EasyDebounce.debounce('check connectivity', const Duration(milliseconds: 1000), () async {
                      await initConnectivity();
                    });
                  },
                  child: Text(
                    'Try Again'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(),
                ))
        ]);
  }

  void initCheckConnection() {
    checkConnectionStream.initConnectivity();
    checkConnectionStream.connectivitySubscription = checkConnectionStream.connectivity.onConnectivityChanged.listen(checkConnectionStream.updateConnectionStatus);
  }

  void exit() async {
    FlutterExitApp.exitApp();
  }

  void next() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(MainPage.routedName);
    });
  }
}
