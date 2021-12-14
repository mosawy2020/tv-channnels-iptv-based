import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:m3u_nullsafe/m3u_nullsafe.dart';

class iptvcontroller extends GetxController {

late RxList channels  = [].obs ;
RxBool isloading = false.obs ;

@override
  onInit(){
  getchannelsmethod() ;

}

  getchannelsmethod () async {
  isloading.value = true ;

  var url2 = Uri.parse('https://laravelbreast.000webhostapp.com/public/api/channels') ;
  final response2 =
  await http.post(url2);
var lista = jsonDecode(response2.body)["data"];
    var url = Uri.parse(lista) ;
    final response =
        await http.get(url);

    if (response.statusCode==200){
      final m3u = await M3uParser.parse(response.body);

      for (final entry in m3u) {
        Map<String , String> item  = new Map() ;
        item ["Logo"] = entry.attributes['tvg-logo']! ;
        item ["title"] = entry.title ;
        item ["link"] = entry.link ;
        channels.add(item) ;
      }
      // print(channels[0]) ;
    }
    else  Get.snackbar(
      "Status : "+response.statusCode.toString(),
      "Check Inernet or update list ",
      duration: Duration(seconds: 5),
      // progressIndicatorBackgroundColor:
      snackPosition: SnackPosition.BOTTOM,
    );
    print(response.statusCode) ;
  isloading.value = false ;

 }

}