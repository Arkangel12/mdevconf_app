import 'package:flutter/material.dart';
import 'package:mdevconf_app/data/models/episodes_page.dart';
import 'package:mdevconf_app/domain/get_episode_page_use_case.dart';

class DataProvider extends ChangeNotifier {
  final GetEpisodePageUseCase _getEpisodePageUseCase;

  DataProvider(this._getEpisodePageUseCase) {
    getEpisodes();
  }

  bool loading = false;

  EpisodesPage? _episodesPage;

  EpisodesPage? get episodesPage => _episodesPage;

  List<Result>? get episodes => _episodesPage!.results;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void getEpisodes() async {
    try {
      load();
      _episodesPage = await _getEpisodePageUseCase();
    } catch (e) {
      _errorMessage = 'error : ${e.toString()}';
    } finally {
      load(false);
    }
  }

  void load([bool isLoading = true]){
    loading = isLoading;
    notifyListeners();
  }
}
