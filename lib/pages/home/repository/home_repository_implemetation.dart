

import 'package:hasura/shared/hasura_rul.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'home_Reprository.dart';

class HomeRepositoryImplematation implements HomeRepository {
  final _client = HasuraConnect(HASURA_URL);
  @override
  Future<List<Map>> getRepository() async {
   final response =  await _client.query(
     '''
      query {
        user {
          id
          name
        }
      }
     '''
   );
  print(response);
  //  return (response['data']['posts'] as List).map((e) => {'name': e['name']}).toList();

   

 

}

  @override
  Stream getStreamRepository() {
    // TODO: implement getStreamRepository
    throw UnimplementedError();
  }
}