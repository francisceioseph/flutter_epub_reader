import 'package:epub_reader/pages/chapter.dart';
import 'package:epub_reader/pages/chapters.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: '/chapters',
        getPages: [
          GetPage(
            name: '/chapters',
            page: () => ChaptersPage(title: 'Epub Reader'),
          ),
          GetPage(
            name: '/chapter/:index',
            page: () => ChapterPage(),
          )
        ],
      ),
    );
