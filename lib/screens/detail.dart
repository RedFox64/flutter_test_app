import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/api/models/character_preview.dart';
import 'package:test_app/api/models/episode.dart';
import 'package:test_app/cubit/character_detail/character_detail_cubit.dart';
import 'package:test_app/ui/main_loader_widget.dart';
import 'package:test_app/ui/styles.dart';
import 'package:test_app/ui/utils.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CharacterDetailView();
  }

  static Route<void> route({required CharacterPreview characterPreview}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => CharacterDetailCubit(
          initialCharacter: characterPreview,
        ),
        child: const CharacterDetailScreen(),
      ),
    );
  }
}

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterPreview character =
        context.select((CharacterDetailCubit bloc) => bloc.initialCharacter);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
        builder: (BuildContext context, CharacterDetailState state) {
          if (state is CharacterDetailInitial) {
            return _buildInitialState();
          }
          if (state is CharacterDetailLoading) {
            return _buildLoadingState();
          }
          if (state is CharacterDetailLoaded) {
            return _buildLoadedState(context, state);
          }

          return _buildErrorState(context);
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return const MainLoader();
  }

  Widget _buildLoadingState() {
    return const MainLoader();
  }

  Widget _buildLoadedState(BuildContext context, CharacterDetailLoaded state) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              state.characterDetail.image,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress?.expectedTotalBytes ==
                    loadingProgress?.cumulativeBytesLoaded) {
                  return child;
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name:", style: TextStyles.h4),
                        const SizedBox(width: 10),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            state.characterDetail.name,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Gender:", style: TextStyles.h4),
                        const SizedBox(width: 10),
                        Icon(
                            UIutils.displayGender(state.characterDetail.gender))
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Status:", style: TextStyles.h4),
                        const SizedBox(width: 10),
                        Text(
                          state.characterDetail.status,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Episodes",
                style: TextStyles.h2,
              ),
            )
          ],
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.characterDetail.episodeList.length,
            itemBuilder: (BuildContext context, int index) {
              Episode characterPreview =
                  state.characterDetail.episodeList[index];

              return ListTile(
                title: Text(characterPreview.name),
                subtitle: Text(characterPreview.episode),
              );
            })
      ],
    ));
  }

  Widget _buildErrorState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Error, please check connection to internet.",
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  "Try again",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CharacterDetailCubit>().fetchCharacter();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
