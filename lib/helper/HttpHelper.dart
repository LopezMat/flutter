import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:intro_flutter/models/Movie.dart';

class HttpHelper {
  //une api peut avoir une clef (mais pas ici)
  final String urlKey = '';
  //la root
  final String urlBase = "https://ghibliapi.vercel.app";
  //la methode principale
  final String urlMethod = "/films";

  Future<List<Movie>> getMovies() async {
    final String url = urlBase + urlMethod;
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return jsonResponse.map<Movie>((movie) => Movie.fromJson(movie)).toList();
    } else {
      return [];
    }
  }


}