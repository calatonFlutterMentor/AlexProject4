import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkService {
  static const _baseurl = 'https://fakestoreapi.com/products';
  Future<T> getRequest<T>(
      T Function(List<dynamic>) parser,
      ) async {
    final response = await http.get(Uri.parse(_baseurl));
    final jsonResp = json.decode(response.body);
    return parser(jsonResp);
  }
}