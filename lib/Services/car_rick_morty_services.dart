import 'package:dio/dio.dart';
import 'package:git_hub_acctions_app/Model/character_model.dart';
import 'package:git_hub_acctions_app/environment.dart';

class RickMortyServices {
  final dio = Dio();
  final String _baseUrl = Environment.baseUrl;

  Future<CharacterModel> getCharacterRickMorty() async {
    try {
      final response = await dio.get('$_baseUrl/character');
      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
