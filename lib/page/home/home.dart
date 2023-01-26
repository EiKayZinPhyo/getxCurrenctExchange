import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homecontroller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //Get other depended controllers
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 200,
                          child: Text(
                            "Currency Exchange",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Expanded(
                            child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                controller: controller.currencyController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Input Value MMK"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                color: Colors.white,
                                child: DropdownButton(
                                  value: controller.selectval.value,
                                  onChanged: (value) {
                                    controller.selectedValue(value);
                                  },
                                  items: controller.listitems.map((itemone) {
                                    return DropdownMenuItem(
                                        value: itemone,
                                        child: Text(itemone.toString()));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                      controller.Convert();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purpleAccent),
                                    child: Text("Convert")),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                color: Colors.white,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Result :"),
                                    Text(controller.moneyResult.value),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(controller.selectval.value),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                );
        }));
  }
}
