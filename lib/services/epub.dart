import 'package:epub/epub.dart';
import 'package:epub_reader/services/file.dart';

class EpubService {
  static Future<EpubBook> readBook(String path) async {
    List<int> bytes = await FileService.readAsBytes(path);
    return EpubReader.readBook(bytes);
  }

  static List<EpubChapter> readChapters(EpubBook book) => book.Chapters.expand(
        (chapter) => [
          chapter,
          if (chapter.SubChapters.isNotEmpty) ...chapter.SubChapters,
        ],
      ).toList();
}
