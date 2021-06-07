import 'package:epub_reader/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:xml/xml.dart' as Xml;

class ChapterPage extends StatelessWidget {
  final BookController _controller = Get.find();
  final int index = int.parse(Get.parameters["index"]);

  ChapterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              final builder = Xml.XmlBuilder();
              builder.element('style', nest: () {
                builder.text("""
                  body {
                    background-color: linen;
                  }
                  p {
                    font-size: 45px;
                    color: #282828;
                  }
                """);
              });

              final styledDoc = builder.build();

              final mainDoc = Xml.parse(_controller.chapter(index).HtmlContent);
              mainDoc
                  .findAllElements('html')
                  .first
                  .children
                  .add(styledDoc.firstChild.copy());

              print(mainDoc
                  .findAllElements('style')
                  .first
                  .toXmlString(pretty: true));

              controller.loadString(
                mainDoc.toXmlString(),
              );
            },
          ),
        ),
      ),
    );
  }
}
