import 'package:flutter/services.dart';

class FileService {
  static Future<List<int>> readAsBytes(String path) async {
    ByteData data = await PlatformAssetBundle().load(path);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
