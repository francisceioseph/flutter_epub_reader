import 'package:epub/epub.dart';
import 'package:epub_reader/services/epub.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<EpubChapter> _chapters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                var bookPath = 'assets/books/alice.epub';
                var book = await EpubService.openBook(bookPath);
                var chapters = await EpubService.readChapters(book);

                setState(() {
                  _chapters = chapters;
                });
              },
              child: Text("Open Book Chapters"),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  var chapter = _chapters[index];
                  return Text(chapter.Title);
                },
                itemCount: _chapters.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
