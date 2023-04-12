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

  bool checkURL(http.Response response) {
    var body;
    try {
      body = json.decode(response.body);
    }catch(FormatException){
      print("Invalid URL");
      return false;
    }
    if(body != null) {
      if(body.containsKey('size') || body.containsKey('response')) {
        return true;
      }
    }
    print("Invalid URL");
    return false;
  }
}