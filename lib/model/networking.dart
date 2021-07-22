import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{

  Networking({this.body,this.url});

  var body;
  String url;

  Future getData() async {

    // Await the http get response, then decode the json-formatted response.
    if (body != null){
      var response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: body
      );
      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('success');
        print(response.body);
        return response.body;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        print(response.body);
      }
    }
    return;

  }
}