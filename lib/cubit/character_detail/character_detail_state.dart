part of 'character_detail_cubit.dart';

@immutable
abstract class CharacterDetailState extends Equatable {}

class CharacterDetailInitial extends CharacterDetailState {
  @override
  List<Object?> get props => [];
}

class CharacterDetailLoading extends CharacterDetailState {
  @override
  List<Object?> get props => [];
}

class CharacterDetailLoaded extends CharacterDetailState {
  final CharacterDetail characterDetail;

  CharacterDetailLoaded({
    required this.characterDetail,
  });

  @override
  List<Object?> get props => [];
}

class CharacterDetailError extends CharacterDetailState {
  final String error;

  CharacterDetailError(this.error);

  @override
  List<Object?> get props => [error];
}
