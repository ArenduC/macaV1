import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ListOfStoreKey {
  static const String loginDetails = "loginDetails";
  static const String borderDetails = "borderDetails";
  static const Map<String, String> allKeys = {
    "loginDetails": loginDetails,
    "borderDetails": borderDetails,
  };
}

class LocalStore {
// Create storage
  final storage = const FlutterSecureStorage();

// Read value
  getStore(dynamic key) async {
    if (ListOfStoreKey.allKeys.containsKey(key)) {
      dynamic value = await storage.read(key: key);
      return jsonDecode(value);
    }
  }

// Delete value
  deleteStore(dynamic key) async {
    await storage.delete(key: key);
  }

// Write value
  Future<dynamic> setStore(dynamic key, dynamic value) async {
    if (ListOfStoreKey.allKeys.containsKey(key)) {
      await storage.write(key: key, value: jsonEncode(value));
    }
  }
}
