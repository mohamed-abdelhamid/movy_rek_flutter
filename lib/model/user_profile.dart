import 'dart:convert';
import 'networking.dart';
import 'end_points.dart';


//unused

class UserProfile{
  addPicture(var pic) async {
    var fileContent = pic.readAsBytesSync();
    var fileContentBase64 = base64.encode(fileContent);
    Map<String,dynamic> picture = Map();
    picture.putIfAbsent("image", () => fileContentBase64);
    var body = json.encode(picture);
    Networking net = Networking(
        url: kUploadPicEP,
        body:body
    );
    var response = await net.putData();
    Map data = jsonDecode(response);
    return data["display_img"];
  }
}