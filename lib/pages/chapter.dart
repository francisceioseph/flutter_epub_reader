import 'package:epub_reader/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterPage extends StatelessWidget {
  final BookController _controller = Get.find();
  final int chapterIndex = int.parse(Get.parameters["index"]);

  ChapterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("${_controller.book.Title}"),
        ),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
