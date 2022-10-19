import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dynamic_view/model/input_model.dart';

class MyRepository {
  Future<List<InputModel>> getDynamicFields() async {
    var dio = Dio();
    try {
      Response response =
          await dio.get("https://dynamic-view-api.free.mockoapp.net/dynamic");

      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        return (response.data["fields"] as List?)
                ?.map((e) => InputModel.fromJson(e))
                .toList() ??
            [];
      }
      return [];
    } catch (error) {
      print(error);
      throw MyCustomFieldsError(errorText: error.toString());
    }
  }
}

class MyCustomFieldsError implements Exception{
  final String errorText;
  MyCustomFieldsError({required this.errorText});
}


