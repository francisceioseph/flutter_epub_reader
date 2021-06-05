import 'package:epub/epub.dart';
import 'package:flutter/material.dart';

class ChapterList extends StatelessWidget {
  final List<EpubChapter> chapters;

  ChapterList({Key key, @required this.chapters}) : super(key: key);

  EpubChapter chapter(int index) => chapters[index];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chapters.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          chapter(index).Title,
        ),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
