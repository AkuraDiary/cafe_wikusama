import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FodeController extends GetxController {

  final isLoading = true.obs;
  final scrollController = ScrollController();
  int _pageNo = 1;
  var currentSeletected = 0.obs;
  var currentSeletectedRating = 0.obs;
  var currentSeletectedSlider = 0.0.obs;
  Rx<RangeValues> values = RangeValues(0, 100.00).obs;
  RxString startLabel = 0.toString().obs;
  RxString endLabel = 100.00.toString().obs;

  final List sizeList = [
    1,
    2,
    3,
    4,
    5,
  ].obs;



  }

