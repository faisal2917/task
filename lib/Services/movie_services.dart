import 'dart:convert';
import 'dart:developer';

import 'package:movie_api_task/Model/movie_model.dart';
import 'package:movie_api_task/Services/constants.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(MyAppConstants.movies));
      print("hello api body..${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> jsonDataList = json.decode(response.body);

        // Convert each JSON object in the list to a MovieResponse object
        final List<Movie> movieList =
            jsonDataList.map((jsonData) => Movie.fromJson(jsonData)).toList();
        log("Message: $jsonDataList");
        return movieList;
      } else {
        // Handle error, e.g., throw an exception or return an empty list
        throw Exception('Failed to load menu data');
      }
    } catch (e) {
      // Handle network or other exceptions
      print('Error: $e');
      return [];
    }
  }
}
