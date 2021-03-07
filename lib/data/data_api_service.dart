import 'package:http/http.dart' as http;
import 'package:mdevconf_app/data/models/episodes_page.dart';

class DataApiService {
  Future<EpisodesPage> getEpisodePage() async {
    late final episodePage, result;
    try {
      final url = Uri.https('rickandmortyapi.com', '/api/episode');
      result = await http.get(url);

      if (result.statusCode == 200) {
        episodePage = episodesPageFromJson(result.body);
      }
    } catch (e) {
      print(e.toString());
    }

    return episodePage;
  }
}
