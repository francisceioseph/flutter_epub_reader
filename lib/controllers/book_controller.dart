import 'package:epub/epub.dart';
import 'package:epub_reader/services/epub.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BookController extends GetxController {
  Rx<EpubBook> book;
  RxList<EpubChapter> chapters = List<EpubChapter>.empty().obs;

  readBook(String path) async {
    EpubBook epubBook = await EpubService.readBook(path);

    this.book = epubBook.obs;

    this.chapters.clear();
    this.chapters.addAll(EpubService.readChapters(epubBook));
  }
}
