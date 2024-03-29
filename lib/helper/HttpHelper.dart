

import 'dart:convert';
import 'dart:io';

import 'package:good_meal/models/Movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper{ // helper de consomation d'api

  final String urlKey = '';
  final String urlBase = "https://ghibliapi.vercel.app";
  final String urlMethod = "/films";

  Future<List<Movie>> getMovies() async { // promise pour récupere une liste de films
    final String gibliApi = urlBase+urlMethod;

    http.Response result = await http.get(Uri.parse(gibliApi));

    if(result.statusCode == HttpStatus.ok){
      final responseBody = jsonDecode(result.body).cast<Map<String,dynamic>>();
      List<Movie> movies = responseBody.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return [];
    }

  }

}