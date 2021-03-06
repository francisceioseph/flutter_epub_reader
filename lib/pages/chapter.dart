import 'package:epub_reader/controllers/book_controller.dart';
import 'package:epub_reader/services/style.dart';
import 'package:epub_reader/services/xml.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ChapterPage extends StatelessWidget {
  final BookController _controller = Get.find();
  final int index = int.parse(Get.parameters["index"]);

  ChapterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("${_controller.chapter(index).Title}"),
        ),
      ),
      body: Center(
        child: Container(
          child: WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              final style = StyleService.createStyle(theme);
              final html = XmlService.buildHtmlWithStyle(
                _controller.chapter(index).HtmlContent,
                style,
              );

              print(style);
              controller.loadString(
                html.toXmlString(),
              );
            },
          ),
        ),
      ),
    );
  }
}
