import 'package:epub_reader/controllers/book_controller.dart';
import 'package:epub_reader/widgets/chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final BookController _controller = Get.put(BookController());

  HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _controller.readBook('assets/books/alice.epub');
              },
              child: Text("Open Book Chapters"),
            ),
            Expanded(
              child: Obx(
                () => ChapterList(
                  chapters: _controller.chapters.toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
