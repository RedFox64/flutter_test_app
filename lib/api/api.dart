import 'package:graphql/client.dart';
import 'package:test_app/api/models/character_detail.dart';
import 'package:test_app/api/models/character_preview_list.dart';
import 'package:test_app/api/queries/queries.dart' as queries;

class ApiClient {
  static String endPoint = "https://rickandmortyapi.com/graphql";
  final GraphQLClient _graphQLClient;

  const ApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory ApiClient.create() {
    final httpLink = HttpLink(endPoint);
    final link = Link.from([httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  Future<CharacterPreviewList> getCharactersList({int page = 1}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
          document: gql(queries.characterListQuery), variables: {"page": page}),
    );

    if (result.hasException) {
      throw result.exception.toString();
    }

    return CharacterPreviewList.fromJson(result.data?["characters"]);
  }

  Future<CharacterDetail> getCharactersDetail({required String id}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
          document: gql(queries.characterDetailQuery), variables: {"id": id}),
    );

    if (result.hasException) {
      throw result.exception.toString();
    }

    return CharacterDetail.fromJson(result.data?["character"]);
  }
}

class CharactersDetailApiClient {}
