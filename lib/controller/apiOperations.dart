import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIoperations {
  static getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "uoUDsoZt9sDd73WL6f6j5xy5S4CTbovxEWg3vdhICq56YTJCMQVjgwtu"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        Map<String, dynamic> src = element["src"];
        debugPrint(src["portrait"]);
        int a = 0;
        print("***********");
        // debugPrint('${a++}');
      });
    });
  }
}
