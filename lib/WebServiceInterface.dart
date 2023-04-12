import 'dart:convert';
import 'package:http/http.dart' as http;

class WebServiceInterface {
  var serverUrl;

  WebServiceInterface(this.serverUrl);

  getInfo(http.Response response) {
    var info = json.decode(response.body);
    return info;
  }
  getNew(http.Response response) {
    var newGame = json.decode(response.body);
    return newGame;
  }
  getPlay(http.Response response) {
    var play = json.decode(response.body);
    return play;
  }
}