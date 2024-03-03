import 'dart:io';

void saveDataToFile(
  String? fieldResponse1,
  String? fieldResponse2,
  String? fieldResponse3,
  String? fieldResponse4,
  String? fieldResponse5,
) {
  File('form_data_response.txt')
      .writeAsStringSync('Field 1 : $fieldResponse1 \n'
          'Field 2 : $fieldResponse2 \n'
          'Field 3 : $fieldResponse3 \n'
          'Field 4 : $fieldResponse4 \n'
          'Field 5 : $fieldResponse5 \n');
}
