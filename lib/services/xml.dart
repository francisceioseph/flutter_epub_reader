import 'package:xml/xml.dart' as Xml;

class XmlService {
  static Xml.XmlDocument parse(String xml) => Xml.parse(xml);

  static Xml.XmlNode _buildStyleNode(String style) {
    final builder = Xml.XmlBuilder();

    builder.element('style', nest: () {
      builder.text(style);
    });

    return builder.build().firstChild.copy();
  }

  static buildHtmlWithStyle(String html, String style) {
    final styleNode = _buildStyleNode(style);
    final document = Xml.parse(html);

    document.findAllElements('html').first.children.add(styleNode);
    return document;
  }
}
