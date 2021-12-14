
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:iptv/view/playvideoview.dart';
import 'package:video_player/video_player.dart';

class playercontroller extends GetxController{
   String link ;
  playercontroller({required this.link});
RxBool done =false.obs ;
@override
// TODO: implement onDelete
  void onInit() {
     // chewieController?.dispose();
     chewieController?.pause();

     // TODO: implement onInit
     play();
    super.onInit();
  }
  get videoPlayerController => VideoPlayerController.network(
      this.link);
var chewieController ;
   play () async {
   await videoPlayerController.initialize();

     chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
         fullScreenByDefault: true,
       allowFullScreen: true,
       showControls: true,showOptions: true,
       additionalOptions: (context) {
         return <OptionItem>[
           OptionItem(
             onTap: (){
               // this.chewieController.exitFullScreen();
               Get.back() ;
               },
             iconData: Icons.live_tv_sharp,
             title: 'translate',
           ),
         ];
       },
    );

 done.value  = true ;
   }


@override
  void onClose() async{
     // print ("hi") ;
    // TODO: implement onClose
  await chewieController.pause();
  super.onClose();
  }


}