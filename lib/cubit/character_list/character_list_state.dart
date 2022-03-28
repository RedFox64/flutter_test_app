part of 'character_list_cubit.dart';

@immutable
abstract class CharacterListState extends Equatable {}

class CharacterListInitial extends CharacterListState {
  @override
  List<Object?> get props => [];
}

class CharacterListLoading extends CharacterListState {
  @override
  List<Object?> get props => [];
}

class CharacterListLoaded extends CharacterListState {
  final List<CharacterPreview> list;
  final bool isLoadAll;

  CharacterListLoaded({required this.list, required this.isLoadAll});

  @override
  List<Object?> get props => [list, isLoadAll];
}

class CharacterListLoadedMore extends CharacterListState {
  final List<CharacterPreview> list;
  final bool isLoadAll;

  CharacterListLoadedMore({required this.list, required this.isLoadAll});

  @override
  List<Object?> get props => [list, isLoadAll];
}

class CharacterListError extends CharacterListState {
  final String error;

  CharacterListError(this.error);

  @override
  List<Object?> get props => [error];
}

class CharacterListErrorLoadMore extends CharacterListState {
  final String error;

  CharacterListErrorLoadMore(this.error);

  @override
  List<Object?> get props => [error];
}
