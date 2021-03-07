import 'package:mdevconf_app/data/data_repository.dart';
import 'package:mdevconf_app/data/models/episodes_page.dart';

class GetEpisodePageUseCase {
  final DataRepository _dataRepository;

  const GetEpisodePageUseCase(this._dataRepository);

  Future<EpisodesPage> call() async => await _dataRepository.getEpisodePage();
}
