import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions.dart';

abstract class LocalDataSource {
  Future<Map<String, dynamic>> getCachedData();

  Future<void> cacheData(Map<String, dynamic> dataToCache);
  Future<void> cacheColor(String color);
}

const cachedDataKey = 'CACHED_DATA';

class LocalDataSourceImp implements LocalDataSource {
  LocalDataSourceImp({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheData(Map<String, dynamic> videosToCache) {
    return sharedPreferences.setString(
      cachedDataKey,
      json.encode(videosToCache),
    );
  }
  @override
  Future<void> cacheColor(String color) {
    return sharedPreferences.setString(
      "appColor",
      json.encode(color),
    );
  }

  @override
  Future<Map<String, dynamic>> getCachedData() async {
    final jsonString = sharedPreferences.getString(cachedDataKey);
    if (jsonString != null) {
      return json.decode(jsonString);
    } else {
      throw CacheException();
    }
  }
}
