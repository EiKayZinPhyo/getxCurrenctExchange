import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getCurrency() async {
    var url = Uri.https('forex.cbm.gov.mm', 'api/latest');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var resp = response.body;
      Map map = jsonDecode(resp);
      return map['rates'];
    } else {
      throw Exception('Failed to load RS');
    }
  }
}
