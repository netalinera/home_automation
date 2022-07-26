import 'dart:convert';
import 'package:http/http.dart' as http;

//
class PostMqtt {
  String data;

  PostMqtt({required this.data});

  factory PostMqtt.fromJson(Map<String, dynamic> object) {
    return PostMqtt(data: object["data"]);
  }

  static Future<PostMqtt> connectMqtt(String data) async {
    String apiURL = "http://192.168.1.52:4000/api/mqtt";
    var apimqtt = await http.post(Uri.parse(apiURL), body: {"data": data});
    // ignore: avoid_print
    print(apimqtt.body);
    var jsonobject = json.decode(apimqtt.body);
    return PostMqtt.fromJson(jsonobject);
  }
}
