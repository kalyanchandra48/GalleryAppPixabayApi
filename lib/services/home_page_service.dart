import 'dart:convert';

import 'package:gallery_app/models/image_data.dart';
import 'package:http/http.dart' as http;

class PixabayApiService {
  static const String baseUrl = 'https://pixabay.com/api/';

  Future<List<PixaBayImage>> fetchImages(String query,int perpage) async {
    final url = Uri.parse(
        '$baseUrl?key=46195755-eda94d846f2ea83feea79d566&q=$query&image_type=photo&per_page=$perpage'); // Replace YOUR_API_KEY with your actual key

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final images = data['hits'] as List<dynamic>;

      return List<PixaBayImage>.from(
          images.map((e) => PixaBayImage.fromMap(e as Map<String, dynamic>)));
    } else {
      throw Exception('Failed to load images');
    }
  }
}
