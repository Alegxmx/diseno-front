import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthService with ChangeNotifier {
  final String urlApi = "http://localhost:8000/graphql/";
  bool _auntenticando = false;

  bool get autenticando => _auntenticando;
  set autenticando(bool valor) {
    _auntenticando = valor;
    notifyListeners();
  }
  
  Future<String?> login(String username, String password) async {
    final HttpLink httpLink = HttpLink(
    urlApi  );

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final MutationOptions options = MutationOptions(
      document: gql('''
        mutation TokenAuth(\$username: String!, \$password: String!) {
          tokenAuth(username: \$username, password: \$password) {
            token
          }
        }
      '''),
      variables: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );

    final QueryResult result = await client.mutate(options);

    print(result);

    final String? token = result.data?['tokenAuth']['token'];
    
    return token;
  }

  Future<bool> register(String username, String email, String password1, String password2) async {
    final HttpLink httpLink = HttpLink(
      urlApi
    );

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final MutationOptions options = MutationOptions(
      document: gql('''
        mutation RegisterUser(\$username: String!, \$email: String!, \$password1: String!, \$password2: String! ){
          register(username: \$username, email: \$email, password1: \$password1, password2: \$password2){
            success,
            errors,
            token
          }
        }
      '''),
      variables: <String, dynamic>{
        'username': username,
        'email': email,
        'password1': password1,
        'password2': password2,
      },
    );

    final QueryResult result = await client.mutate(options);

    print(result);

    final bool success = result.data?['register']['success'];

    print(success);

    if (result.hasException || success == false) {
      return false;
    }

    return true;
  }
}
