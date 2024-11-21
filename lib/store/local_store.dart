import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStore {
// Create storage
  final storage = const FlutterSecureStorage();

  dynamic listOfKeyStore = [
    {"LOGINDETAILS": "LOGINDETAILS"},
    {"BORDERDETAILS": "BORDERDETAILS"}
  ];

// Read value
  getStore(dynamic key) async {
    if (listOfKeyStore.contains(key)) {
      dynamic value = await storage.read(key: key);
      return value;
    }
  }

// Delete value
  deleteStore(dynamic key) async {
    await storage.delete(key: key);
  }

// Write value
  setStore(dynamic key, dynamic value) async {
    if (listOfKeyStore.contains(key)) {
      await storage.write(key: key, value: value);
    }
  }
}
