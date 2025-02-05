import 'package:flutter/material.dart';
import 'package:list_to_csv_excel/list_to_csv_excel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> exportCSV() async {
    List<String> header = ["Id", "Email", "Password"];

    List<List<String>> body = [
      ["1", "admin@gmail.com", "admin@123"],
      ["2", "admin@gmail.com", "admin@123"],
      ["3", "admin@gmail.com", "admin@123"],
    ];

    await CsvFileCreate().csvFileCreate(
      header,
      body,
      exportFileType: ExportFileType.excel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: \n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => exportCSV(),
          child: Icon(Icons.download_rounded),
        ),
      ),
    );
  }
}
