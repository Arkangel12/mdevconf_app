import 'package:get_it/get_it.dart';
import 'package:mdevconf_app/data/data_api_service.dart';
import 'package:mdevconf_app/data/data_repository.dart';
import 'package:mdevconf_app/domain/get_episode_page_use_case.dart';
import 'package:mdevconf_app/presentation/providers/data_provider.dart';

final _injector = GetIt.instance;

void setup() {
  _injector.registerLazySingleton<DataApiService>(
    () => DataApiService(),
  );

  _injector.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(_injector<DataApiService>()),
  );

  _injector.registerLazySingleton(
    () => DataProvider(_injector<GetEpisodePageUseCase>()),
  );

  _injector.registerLazySingleton(
    () => GetEpisodePageUseCase(_injector<DataRepository>()),
  );
}
