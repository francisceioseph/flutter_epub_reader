import 'package:epub/epub.dart';
import 'package:epub_reader/services/file.dart';

class EpubService {
  static Future<EpubBookRef> openBook(String path) async {
    List<int> bytes = await FileService.readAsBytes(path);
    return EpubReader.openBook(bytes);
  }

  static Future<List<EpubChapter>> readChapters(EpubBookRef bookRef) async {
    var chaptersRefs = await bookRef.getChapters();
    var chapters = await EpubReader.readChapters(chaptersRefs);

    return chapters
        .expand(
          (chapter) => [
            chapter,
            if (chapter.SubChapters.isNotEmpty) ...chapter.SubChapters,
          ],
        )
        .toList();
  }
}
