import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../entity/api_error.dart';
import '../entity/list_character_entity.dart';

class ApiService {
  static const endpoint = 'https://www.anapioficeandfire.com/api/characters';

  Future<Either<ApiError, dynamic>> getCharacters() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return Right(ListCharacter.fromJson(jsonDecode(response.body) as List)
          .characters
          .toSet()); // convert to a set to get an unique list
    }
    return const Left(ApiError.empty());
  }
}
