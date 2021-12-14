import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iptv/controller/playercontroller.dart';
import 'package:iptv/view/iptvview.dart';

class playview extends GetView<playercontroller> {

  @override
  Widget build(BuildContext context) {
    dynamic  argumentData = Get.arguments;

  print (argumentData) ;

    var x = Get.lazyPut(() => playercontroller(link:argumentData[0].toString()));

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){

          Get.back();

        },),
        actions: [
          InkWell(child: Icon(Icons.fullscreen),onTap: (){

            controller.chewieController.enterFullScreen();
   },)
        ],
      ),
      body:  Column(
        children: [
          Expanded(
            child: Obx(() => (controller.done==true) ? Chewie(
              controller: controller.chewieController,

            ):Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ) ),
          ),
        ],
      ),
    );

  }


}
