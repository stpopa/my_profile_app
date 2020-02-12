import 'dart:async';

import 'package:endava_profile_app/modules/home/models/profile.dart';
import 'package:endava_profile_app/modules/contributors/services/profile_service.dart';

enum HomeEventType { initial }

class HomeBloc {
  final apiService = ProfileService();

  var _eventSubject = StreamController<HomeEventType>.broadcast();
  var _profileSubject = StreamController<Profile>.broadcast();

  Stream<Profile> get profileStream => _profileSubject.stream;
  Sink<HomeEventType> get eventSink => _eventSubject.sink;


  HomeBloc() {
    _eventSubject.stream.listen(_onEvent);
  }

  void _onEvent(HomeEventType event) {
    switch (event) {
      case HomeEventType.initial:
      //   todo apiService.fetchProfile();
        _profileSubject.add(Profile());
    }
  }

  void dispose() {
    _eventSubject.close();
    _profileSubject.close();
  }
}
