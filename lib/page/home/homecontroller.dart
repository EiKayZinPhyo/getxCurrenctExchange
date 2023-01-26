import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/api.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  TextEditingController currencyController = TextEditingController();
  RxList listitems = RxList();

  late Map map;

  RxBool isLoading = RxBool(true);
  var selectval = "USD".obs;

  selectedValue(value) {
    selectval.value = value;
  }

  HomeController() {
    fetchingCurrencyFromApi();
  }

  RxString moneyResult = RxString("");

  void Convert() {
    print(selectval);
    print(map[selectval.toString()]);

    final curValue = double.parse(
        map[selectval.toString()].toString().replaceAll(RegExp(r'[,]'), ''));

    final moneyValue = double.parse(currencyController.text);
    var finalResult = moneyValue / curValue;

    moneyResult.value = finalResult.toStringAsFixed(2);
  }

  fetchingCurrencyFromApi() async {
    if (listitems.isEmpty) {
      isLoading.value = true;
      final result = await Api().getCurrency();

      map = result;
      listitems.clear();
      listitems.addAll(map.keys.toList());
      isLoading.value = false;
      print("loading value is ${isLoading.value}");
      print(map.keys.toList());
    }

    //print(result);
  }
}
