import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List> fetchMovies(String query) async {
    final url = Uri.parse('https://api.tvmaze.com/search/shows?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body).map((e) => e['show']).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
