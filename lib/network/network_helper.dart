import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<http.Response> get(String endpoint) async {
    var url = Uri.parse(endpoint);
    var response = await http.get(url);
    return response;
  }
}
