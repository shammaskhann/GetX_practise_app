import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_getx/func/Function.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppFunctions func = Get.put(AppFunctions());
    var togg= false;
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Tutorial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(func.sec.toString(),),),
            Container(
              width: Get.width * 0.2,
              child: ElevatedButton(onPressed:(){
                func.secondsCounter();
              }, child: const Center(
                child: Text('ADD'),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(value: togg, onChanged:(value){
                func.toggleDarkMode(togg);
                togg=!togg;
              }
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alert),
          onPressed:(){
        Get.snackbar("Main Heading", "subtitle");
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //backgroundColor: Colors.red.shade900,
    );
  }
}
