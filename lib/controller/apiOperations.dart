import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wall_x/models/photosModel.dart';

class APIoperations {
  static List<PhotosModel> trendingWallpapers = [];
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "uoUDsoZt9sDd73WL6f6j5xy5S4CTbovxEWg3vdhICq56YTJCMQVjgwtu"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });
    return trendingWallpapers;
  }
}
