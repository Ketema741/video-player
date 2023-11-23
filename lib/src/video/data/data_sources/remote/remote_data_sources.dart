import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/error/exceptions.dart';

abstract class RemoteDataSource {
  Future<Map<String, dynamic>> fetchData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse('https://app.et/devtest/list.json');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
