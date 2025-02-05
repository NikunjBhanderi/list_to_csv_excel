# list_to_csv_excel

-> This flutter package to create a csv and excel file for your data in flutter applications and web apps.
-> You can create and download a csv and excel file with much less code. Do not forget to like the package...

## How to use
**Make sure to check out [examples](https://github.com/NikunjBhanderi/list_to_csv_excel/blob/version-1.0.0/example/lib/main.dart) for more details.**


# Getting started
1. Add the latest version of package to your `pubspec.yaml`

```yaml
dependencies:
  list_to_csv_excel: ^1.0.0
```

or

1. Add the latest version of package via command

```bash
flutter pub add list_to_csv_excel
flutter pub get
```


2. Import the package and use it in your Flutter App
```dart
import 'package:list_to_csv_excel/list_to_csv_excel.dart';
```

3. Create a Header Data of your table or excel file.
```dart
List<String> header = ["Id", "Email", "Password"];
```


4. Also create a two lists which contains your list of rows as List.
```dart
List<List<String>> listOfRowData = [];
listOfRowData = ["1", "admin@gmail.com", "123456789"];
listOfRowData = ["2", "admin1@gmail.com", "admin"];
```


5. Finally pass header and listOfRowData to the package function like this:
```dart
await CsvFileCreate().csvFileCreate(header, body);
```
And your csv file will be downloaded in seconds. Open it on excel or in any other app and Enjoy.

### All Property

-------------------------------------------------------------------------------------------------------------
| Argument         | Type               | option type | description                                         |
-------------------------------------------------------------------------------------------------------------
| listOfHeaderData | List<String>       | required    | to show header data in csv and excel file           |
| listOfBodyData   | List<List<String>> | required    | to show body data in csv and excel file             |
| fileName         | String             | optional    | file name for csv and excel file                    |
| isShareFile      | bool               | optional    | share file in android and iOS device                |
| exportFileType   | enum               | optional    | to choice to download csv file or excel format file |
-------------------------------------------------------------------------------------------------------------
