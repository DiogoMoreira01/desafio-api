import 'package:desafio_consumo_api/models/model_filmes.dart';
import 'package:desafio_consumo_api/repository/filmes_repository.dart';

class FilmesController {
  final _filmesRepository = FilmesRepository();

  Future<void> findAll() async {
    final filmes = await _filmesRepository.findAll();

    filmes.forEach(print);
  }

  Future<void> findById(String id) async {
    final filmes = await _filmesRepository.findById(id);
    print(filmes);
  }

  Future<void> update() async {
    final filmes = await _filmesRepository.findById('919689');

    filmes.genrsId.add(2);

    await _filmesRepository.update(filmes);

    final filmesAlterados = await _filmesRepository.findById('919689');

    print(filmesAlterados.genrsId);
  }

  Future<void> insert() async {
    final filmes = ModelFilmes(
      adult: true,
      backdropPath: 'backdropPath',
      genrsId: [10, 20],
      //id: id,
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 9.2,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: true,
      voteAverage: 9.5,
      voteCount: 100,
    );
    _filmesRepository.insert(filmes);
  }
}
