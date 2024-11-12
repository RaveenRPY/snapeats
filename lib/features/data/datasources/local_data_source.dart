import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:snapeats/features/data/models/data_model.dart';

class LocalDataSource {
  Future<DataModel> fetchData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/assignment-dataset.json');
      final data = json.decode(response);

      return DataModel.fromJson(data);
    } on Exception {
      rethrow;
    }
  }
}
