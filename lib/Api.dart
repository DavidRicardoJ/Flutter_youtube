import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDaz_ba9qXLprsZNYrGuuYhtgMkssG5CNU";
const ID_CANAL = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const PARAMETRO_PESQUISA = "search";

class Api {
  Future<List<Video>>pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        PARAMETRO_PESQUISA +
        "?part=snippet" +
        "&channelId=$ID_CANAL" +
        "&type=video" +
        "&maxResults=20" +
        "&key=$CHAVE_YOUTUBE_API"
            "&q=$pesquisa");
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    }else return null;
  }
}
