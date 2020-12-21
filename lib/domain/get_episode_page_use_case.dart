import 'package:mdevconf_app/data/data_repository.dart';
import 'package:mdevconf_app/data/models/episodes_page.dart';

class GetEpisodePageUseCase {
  final DataRepository _dataRepository;

  GetEpisodePageUseCase(this._dataRepository) : assert(_dataRepository != null);

  Future<EpisodesPage> call() async => await _dataRepository.getEpisodePage();
}
