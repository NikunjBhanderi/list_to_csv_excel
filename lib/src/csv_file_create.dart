import 'dart:convert';
import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:list_to_csv_excel/src/convert_file_path_to_xfile.dart';
import 'package:list_to_csv_excel/src/package/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;

enum ExportFileType { csv, excel }

class CsvFileCreate {
  Future<void> csvFileCreate(
    List<String> listOfHeaderData,
    List<List<String>> listOfBodyData, {
    String? fileName,
    bool? isShareFile,
    ExportFileType? exportFileType,
  }) async {
    String csvFileName =
        fileName ?? "item_export_${DateTime.now().microsecondsSinceEpoch}";

    List<List<String>> headerAndDataList = [];

    if (listOfHeaderData.isEmpty) {
      return;
    }

    if (listOfBodyData.isEmpty) {
      return;
    }

    bool isSame = true;
    for (var bodyData in listOfBodyData) {
      if (listOfHeaderData.length != bodyData.length) {
        isSame = false;
      }
    }

    if (isSame == false) {
      return;
    }

    headerAndDataList.add(listOfHeaderData);
    headerAndDataList.addAll(listOfBodyData);

    String csvData =
        ListToCsvConverter(fieldDelimiter: ",").convert(headerAndDataList);

    if (kIsWeb) {
      final bytes = utf8.encode(csvData);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..download = exportFileType == ExportFileType.csv
            ? "$csvFileName.csv"
            : exportFileType == ExportFileType.excel
                ? "$csvFileName.xlsx"
                : "";
      html.document.body!.children.add(anchor);
      anchor.click();
      html.Url.revokeObjectUrl(url);
    } else if (Platform.isAndroid || Platform.isIOS) {
      var filePath = await FileSaver.instance.saveAs(
        name: csvFileName,
        bytes: Uint8List.fromList(utf8.encode(csvData)),
        ext: exportFileType == ExportFileType.csv
            ? "csv"
            : exportFileType == ExportFileType.excel
                ? "xlsx"
                : "",
        mimeType: exportFileType == ExportFileType.csv
            ? MimeType.csv
            : exportFileType == ExportFileType.excel
                ? MimeType.microsoftExcel
                : MimeType.text,
        filePath: (await getApplicationDocumentsDirectory()).path,
      );

      if (isShareFile == true) {
        if (filePath == null) return;
        var file = await ConvertFilePathToXfile().fileToXFile(filePath);
        await Share.shareXFiles([file]);
      }
    }
  }
}
