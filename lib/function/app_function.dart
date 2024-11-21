import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppFunction {
  macaPrint(dynamic data) {
    if (kDebugMode) {
      print("macaPrint: $data");
    }
  }

  macaApiResponsePrintAndGet(dynamic data, [dynamic extractData]) {
    if (kDebugMode) {
      if (data.statusCode == 200) {
        dynamic response = jsonDecode(data.body);
        if (extractData == "data") {
          print("Api  response: ${response["data"]}");
          return response["data"];
        } else {
          print("Api response: $response");
          return response;
        }
      }
    }
  }

  dynamic createBedStatusList(dynamic userBeds, dynamic allBeds) {
    // Create a set of active user_bed values for quick lookup
    final activeBeds = userBeds.map((bed) => bed['user_bed']).toSet();

    // Map over allBeds and add the is_active key
    return allBeds.map((bed) {
      return {
        ...bed,
        'is_active':
            activeBeds.contains(bed['user_bed']), // True if present in userBeds
      };
    }).toList();
  }
}
