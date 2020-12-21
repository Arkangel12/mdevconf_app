import 'package:http/http.dart' as http;
import 'package:mdevconf_app/data/models/episodes_page.dart';

class DataApiService {
  Future<EpisodesPage> getEpisodePage() async{
    var episodePage;
    try{
      final url = 'https://rickandmortyapi.com/api/episode';
      final result = await http.get(url);

      if(result.statusCode == 200){
        episodePage = episodesPageFromJson(result.body);
      }

    } catch(e){
      print(e.toString());
    }

    return episodePage;
  }
}