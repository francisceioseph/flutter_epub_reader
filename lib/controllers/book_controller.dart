import 'package:epub/epub.dart';
import 'package:epub_reader/services/epub.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BookController extends GetxController {
  Rx<EpubBookRef> book;
  RxList<EpubChapter> chapters = List<EpubChapter>.empty().obs;

  readBook(String path) async {
    var book = await EpubService.openBook(path);
    var chapters = await EpubService.readChapters(book);

    this.book = book.obs;
    this.chapters = chapters.obs;
  }
}
