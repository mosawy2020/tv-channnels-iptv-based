import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iptv/view/iptvview.dart';

void main() {

  runApp(

   Shortcuts(
  shortcuts: <LogicalKeySet, Intent>{
  LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
  },
        child: GetMaterialApp( theme: ThemeData(
          primaryColor: Colors.teal,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ).copyWith(
            secondary: Colors.teal,
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.teal)),
        ),
            home:iptvview()),
      )

  );
}

