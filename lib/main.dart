import 'package:epub_reader/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeScreen(title: 'Epub Reader'),
          ),
        ],
      ),
    );
