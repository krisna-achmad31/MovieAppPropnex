import 'dart:async';
import 'dart:io';

import 'package:PropnexTestApp/controller/CheckConnectionController.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  CheckConnectionStream checkConnectionStream = CheckConnectionStream();

  Map _source = {ConnectivityResult.none: false};

  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  var children = 0.obs;

  var isNetworkOnline = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnectionStream.initConnectivity();
    checkConnectionStream.connectivitySubscription = checkConnectionStream.connectivity.onConnectivityChanged.listen(checkConnectionStream.updateConnectionStatus);
    // hasNetwork();
    // initialise();
  }

  @override
  void onClose() {
    checkConnectionStream.connectivitySubscription.cancel();
    super.onClose();
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void initialise() async {
    bool isOnline = await hasNetwork();
    isNetworkOnline(isOnline);
    print('this condition is ${isNetworkOnline.value}');
  }

  void changeTabIndex(int index) {
    children.value = index;
  }
}
