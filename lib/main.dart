import 'package:epub_reader/pages/chapter.dart';
import 'package:epub_reader/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomePage(title: 'Epub Reader'),
          ),
          GetPage(
            name: '/chapter/:index',
            page: () => ChapterPage(),
          )
        ],
      ),
    );
