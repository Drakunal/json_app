import 'dart:convert';

import 'package:http/http.dart';

class Network {
  final String url;

  Network({required this.url});
  Future fetchData() async {
    print(url);
    Uri uri = Uri.parse(Uri.encodeFull(url));
    Response response = await get(uri);
    if (response.statusCode == 200) {
      // print(json.encode(response.body));
      return json.decode(response.body);
    } else {
      // print(response.statusCode);
      return response.statusCode;
    }
  }
}
