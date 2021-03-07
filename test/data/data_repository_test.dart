import 'package:flutter_test/flutter_test.dart';
import 'package:mdevconf_app/data/data_api_service.dart';
import 'package:mdevconf_app/data/data_repository.dart';
import 'package:mdevconf_app/data/models/episodes_page.dart';
import 'package:mockito/mockito.dart';

class MockDataApiService extends Mock implements DataApiService {}

void main() {
  late MockDataApiService mockDataApiService;
  late DataRepository dataRepository;

  group('data repository', () {
    setUp(() {
      mockDataApiService = MockDataApiService();
      dataRepository = DataRepositoryImpl(mockDataApiService);
    });

    test('should get episodes', () async {
      var info = Info(count: 1, pages: 1, next: '1', prev: null);
      var resultEpisode = List.generate(
        3,
        (index) => Result(
          id: index,
          name: 'name',
          airDate: DateTime(2021).toString(),
          episode: 'episode 1',
          characters: ['1'],
          url: 'url',
          created: DateTime(2021),
        ),
      );
      var episodePage = EpisodesPage(info: info, results: resultEpisode);
      when(mockDataApiService.getEpisodePage()).thenAnswer((_) async=> episodePage);

      final result = await dataRepository.getEpisodePage();

      expect(result, isA<EpisodesPage>());
      verify(mockDataApiService.getEpisodePage());
      verifyNoMoreInteractions(mockDataApiService);
    });
  });
}
