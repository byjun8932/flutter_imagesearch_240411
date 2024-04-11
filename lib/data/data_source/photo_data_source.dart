import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/photo_result_dto.dart';

class PhotoDataSource {
  final _baseUrl = 'https://pixabay.com/api/';

  Future<PhotoResultDto> getPhotoResult(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?key=43171088-13f23c4440e19572a32b036be&q=$query&image_type=photo'));

    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }
}
