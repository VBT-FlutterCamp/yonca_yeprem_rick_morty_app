import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/network/network_manager.dart';
import 'model/character_model.dart';
import 'rickmorty.dart';

class RickMortyViewModel extends State<RickMorty> {
  final Dio dio = NetworkManager.instance.dio;
  List<CharacterModel> characterList = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.CHARACTER.rawValue);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharacterModel = BaseResponseCharacter.fromJson(data);
        characterList = baseCharacterModel.results ?? [];
      } else if (data is List) {
        characterList = data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

enum ServicePath { CHARACTER }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.CHARACTER:
        return "/character";
    }
  }
}
