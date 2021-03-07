import 'package:mdevconf_app/data/data_api_service.dart';
import 'package:mdevconf_app/data/models/episodes_page.dart';

abstract class DataRepository {
  Future<EpisodesPage> getEpisodePage();
}

class DataRepositoryImpl extends DataRepository {
  final DataApiService _dataApiService;

  DataRepositoryImpl(this._dataApiService);

  @override
  Future<EpisodesPage> getEpisodePage() async =>
      await _dataApiService.getEpisodePage();
}
