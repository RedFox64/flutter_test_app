import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/api/models/character_preview.dart';
import 'package:test_app/cubit/character_list/character_list_cubit.dart';
import 'package:test_app/screens/detail.dart';
import 'package:test_app/ui/lazy_load_widget.dart';
import 'package:test_app/ui/main_loader_widget.dart';
import 'package:test_app/ui/utils.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character List"),
        centerTitle: true,
      ),
      body: BlocConsumer<CharacterListCubit, CharacterListState>(
        listener: (context, state) {
          if (state is CharacterListErrorLoadMore) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.blue,
              content: Text('Error, please check connection to internet.'),
            ));
          }
        },
        buildWhen: (oldState, newState) {
          if (newState is CharacterListErrorLoadMore) {
            return false;
          }

          return true;
        },
        builder: (BuildContext context, CharacterListState state) {
          if (state is CharacterListInitial) {
            return _buildInitialState();
          }
          if (state is CharacterListLoading) {
            return _buildLoadingState();
          }
          if (state is CharacterListLoaded) {
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

  Widget _buildLoadedState(BuildContext context, CharacterListLoaded state) {
    return NotificationListener<ScrollNotification>(
      child: ListView.builder(
          itemCount:
              state.isLoadAll ? state.list.length : state.list.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (state.list.length <= index) {
              return const LazyLoadWidget();
            }

            CharacterPreview characterPreview = state.list[index];

            return ListTile(
              leading: Image.network(
                characterPreview.image,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress?.expectedTotalBytes ==
                      loadingProgress?.cumulativeBytesLoaded) {
                    return child;
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              title: Text(characterPreview.name),
              subtitle: Row(
                children: [
                  const Text("Gender:"),
                  const SizedBox(width: 10),
                  Icon(UIutils.displayGender(characterPreview.gender))
                ],
              ),
              onTap: () {
                Navigator.of(context).push(CharacterDetailScreen.route(
                    characterPreview: characterPreview));
              },
            );
          }),
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels >
            notification.metrics.maxScrollExtent * 0.9) {
          context.read<CharacterListCubit>().loadMore();
        }

        return true;
      },
    );
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
                  context.read<CharacterListCubit>().fetchCharacterList();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
