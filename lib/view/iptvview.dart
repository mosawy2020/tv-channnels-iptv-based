import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iptv/controller/iptvcontroller.dart';
import 'package:iptv/controller/playercontroller.dart';
import 'package:iptv/view/playvideoview.dart';

class iptvview extends GetView<iptvcontroller> {
  // const iptvview({Key key}) : super(key: key);
var c = Get.lazyPut(() => iptvcontroller()) ;
 // var x = Get.lazyPut(() => playercontroller()) ;

// var  c2 = Get.find<playercontroller>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mh"),
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.tv) , onPressed: (){},),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.05,) ,

             Container(
               child: Expanded(
                 child: Container(
                child:

                Obx( (){
                  return (controller.isloading.value==true ) ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CircularProgressIndicator( ),
                    ],
                  ) :

               GridView.count(
                     scrollDirection: Axis.vertical,
                  keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.manual ,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(controller.channels.length, (index) {
                  return Center(
                  child:InkWell(focusColor: Colors.redAccent,
                      onTap: (){

                              Get.to(playview(),arguments: [controller.channels[index]["link"],"hghjfghd"]) ;

                  // return AlertDialog(c2.play().show() )  ;
                  },
                      child: Image.network(controller.channels[index]["Logo"] ,
                        loadingBuilder:(BuildContext context, Widget child,loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ?
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                  ),
                  );
                  }),
                  );

                 }

      )
            ),
          ),
             ),
        ],
      ),


    );
  }
  Widget item (int index , String src , String title){
    return   Row(
      children: [

        Column(
          children: [
            Image.network(src) ,
            Text(title)
          ],
        )
      ],
    ) ;
  }
}
