import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<void> saveDataToFile(
  String? fieldResponse1,
  String? fieldResponse2,
  String? fieldResponse3,
  String? fieldResponse4,
  String? fieldResponse5,
) async {
  final file = File('/storage/emulated/0/Download/Finayo/form_response.txt');
  if (!file.existsSync()) {
    File file =
        await File('/storage/emulated/0/Download/Finayo/form_response.txt')
            .create(recursive: true);
    file.writeAsStringSync('First Name : $fieldResponse1 \n'
        'Last Name : $fieldResponse2 \n'
        'Your current address : $fieldResponse3 \n'
        'Your Passeord : $fieldResponse4 \n'
        'Remember Me: $fieldResponse5 \n');
  } else {
    file.writeAsStringSync('Field 1 : $fieldResponse1 \n'
        'Field 2 : $fieldResponse2 \n'
        'Field 3 : $fieldResponse3 \n'
        'Field 4 : $fieldResponse4 \n'
        'Field 5 : $fieldResponse5 \n');
  }
}
