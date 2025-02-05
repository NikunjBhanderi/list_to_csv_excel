// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:list_to_csv_excel/list_to_csv_excel.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    List<String> header = [
      "Id",
      "Email",
      "Password",
    ];

    List<List<String>> body = [
      ["1", "admin@gmail.com", "admin@123"],
      ["2", "admin@gmail.com", "admin@123"],
      ["1", "admin@gmail.com", "admin@123"],
    ];

    await CsvFileCreate().csvFileCreate(header, body);
  });
}
