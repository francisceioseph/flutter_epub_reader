import 'package:epub/epub.dart';
import 'package:epub_reader/services/epub.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BookController extends GetxController {
  Rx<EpubBook> _book;
  RxList<EpubChapter> _chapters = List<EpubChapter>.empty().obs;

  EpubBook get book => _book.value;
  List<EpubChapter> get chapters => _chapters.toList();

  @override
  void onInit() async {
    super.onInit();
    readBook('assets/books/alice.epub');
  }

  readBook(String path) async {
    EpubBook book = await EpubService.readBook(path);

    _book = book.obs;
    _chapters.clear();
    _chapters.addAll(EpubService.readChapters(book));
  }
}
