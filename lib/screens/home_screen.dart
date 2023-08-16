import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_getx/func/Function.dart';
import 'package:practice_getx/func/ImagePickerController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagecontroller = Get.put(ImagePickerController());
    AppFunctions func = Get.put(AppFunctions());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Tutorial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed:(){
              imagecontroller.getImage();
            }, child: const Text("Take Image")),
            Obx((){ return
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: imagecontroller.imagePath.isNotEmpty ?
                    FileImage(File(imagecontroller.imagePath.toString()),
                    ) : null
                  ),
                  ElevatedButton(onPressed:(){
                    imagecontroller.getImage();
                  }, child: const Text("Take Image")),
                ],
              );
            }

            ),
            const  SizedBox(
              height: 40,
            ),
            Obx(
              () => Text(
                func.sec.toString(),
              ),
            ),
            SizedBox(
              width: Get.width * 0.2,
              child: ElevatedButton(
                  onPressed: () {
                    func.secondsCounter();
                  },
                  child: const Center(
                    child: Text('ADD'),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Switch(
                value: func.darKmode.value,
                onChanged: (value) {func.toggleDarkMode(value);
                func.darKmode.value= value ;
                }
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_alert),
          onPressed: () {
            Get.snackbar("Main Heading", "subtitle");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //backgroundColor: Colors.red.shade900,
    );
  }
}
