import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/api/api.dart';
import 'package:test_app/api/models/character_preview.dart';
import 'package:test_app/api/models/character_preview_list.dart';
import 'package:test_app/api/models/info_response.dart';

part 'character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit() : super(CharacterListInitial()) {
    _client = ApiClient.create();

    fetchCharacterList();
  }

  late ApiClient _client;
  late List<CharacterPreview> characterList;
  late int nextPage;
  bool isLoadedAll = false;
  bool isLoadedNewPage = false;
  int itemsPerPage = 20;

  void checkNextPage(InfoResponce info) {
    if (info.nextPage == null) {
      isLoadedAll = true;
    } else {
      nextPage = info.nextPage!;
      isLoadedNewPage = true;
    }
  }

  void fetchCharacterList() async {
    nextPage = 1;

    try {
      emit(CharacterListLoading());

      CharacterPreviewList result = await _client.getCharactersList();
      characterList = result.characterPreviewList;

      checkNextPage(result.info);

      emit(CharacterListLoaded(list: characterList, isLoadAll: isLoadedAll));
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }

  void loadMore() async {
    if (isLoadedNewPage && (nextPage * itemsPerPage > characterList.length)) {
      try {
        isLoadedNewPage = false;

        CharacterPreviewList result =
            await _client.getCharactersList(page: nextPage);

        characterList = [...characterList, ...result.characterPreviewList];

        checkNextPage(result.info);

        emit(CharacterListLoaded(list: characterList, isLoadAll: isLoadedAll));
      } catch (e) {
        isLoadedNewPage = true;
        emit(CharacterListErrorLoadMore(e.toString()));
      }
    }
  }
}
