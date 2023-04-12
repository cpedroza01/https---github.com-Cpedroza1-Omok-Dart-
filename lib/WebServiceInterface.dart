import 'dart:convert';
import 'package:http/http.dart' as http;

class WebServiceInterface {
  var serverUrl;

  WebServiceInterface(this.serverUrl);

  ///gets the response from the info api
  getInfo(http.Response response) {
    var info = json.decode(response.body);
    return info;
  }

  ///gets the response from the new api
  getNew(http.Response response) {
    var newGame = json.decode(response.body);
    return newGame;
  }

  ///gets the response from the play api
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