import 'dart:io';

import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class ConvertFilePathToXfile {
  Future<XFile> fileToXFile(String filePath) async {
    File file = File(filePath);

    if (!(await file.exists())) {
      await file.delete(recursive: true);
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String fileName = basename(filePath);

    String targetPath = join(directory.path, fileName);
    await file.copy(targetPath);

    return XFile(targetPath);
  }
}
