import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/api/api.dart';
import 'package:test_app/api/models/character_detail.dart';
import 'package:test_app/api/models/character_preview.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharacterPreview initialCharacter;
  late CharacterDetail characterDetail;
  late ApiClient _client;

  CharacterDetailCubit({required this.initialCharacter})
      : super(CharacterDetailInitial()) {
    _client = ApiClient.create();

    fetchCharacter();
  }

  void fetchCharacter() async {
    emit(CharacterDetailLoading());

    try {
      characterDetail =
          await _client.getCharactersDetail(id: initialCharacter.id);

      emit(CharacterDetailLoaded(characterDetail: characterDetail));
    } catch (e) {
      emit(CharacterDetailError(e.toString()));
    }
  }
}
