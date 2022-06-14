import 'dart:convert';

import 'package:desafio_consumo_api/models/model_filmes.dart';
import 'package:http/http.dart' as http;

class FilmesRepository {
  Future<List<ModelFilmes>> findAll() async {
    final filmesRepository =
        await http.get(Uri.parse('http://localhost:3031/filmes'));
    print(filmesRepository.body);
    final filmesList = jsonDecode(filmesRepository.body);
    return filmesList.map<ModelFilmes>((filmesMap) {
      return ModelFilmes.fromMap(filmesMap);
    }).toList();
  }

  Future<ModelFilmes> findById(String id) async {
    final filmesResponse =
        await http.get(Uri.parse('http://localhost:3031/filmes/$id'));

    return ModelFilmes.fromJson(filmesResponse.body);
  }

  Future<void> update(ModelFilmes modelFilmes) async {
    await http.put(Uri.parse('http://localhost:3031/filmes/${modelFilmes.id}'),
        body: modelFilmes.toJson(),
        headers: {'content-type': 'application/json'});
  }

  Future<void> insert(ModelFilmes modelFilmes) async {
    await http.post(Uri.parse('http://localhost:3031/filmes/'),
        body: modelFilmes.toJson(),
        headers: {'content-type': 'application/json'});
  }
}
