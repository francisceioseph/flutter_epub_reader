import 'package:flutter/material.dart';
import 'package:epub_reader/extensions/color.dart';

class StyleService {
  static createStyle(ThemeData theme) => """
      @import url('https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=EB+Garamond&display=swap');

      body {
        background-color: ${theme.scaffoldBackgroundColor.toHexString()};
      }

      h1, h2, h3{
        font-family: 'Playfair Display', serif;
        color: ${theme.textTheme.headline1.color.toHexString()};
      }

      h4, h5, h6 {
        font-family: 'Playfair Display', serif;
        color: ${theme.textTheme.subtitle1.color.toHexString()};
      }

      p {
        font-family: 'EB Garamond', serif;
        font-size: 18px;
        text-indent: 10%;
        text-align: justify;
        color: ${theme.textTheme.bodyText1.color.toHexString()};
      }
    """;
}
