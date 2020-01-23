import 'dart:async';
import 'services/github_service.dart';
import 'models/contributor.dart';

enum ContributorEventType { initial, cacheLifetime }

class ContributorEvent {
  ContributorEventType type;
  dynamic value;

  ContributorEvent(this.type, {this.value});
}

class ContributorsBloc {
  final apiService = GithubService();

  StreamController<ContributorEvent> _eventSubject =
      StreamController<ContributorEvent>.broadcast();

  StreamController<List<Contributor>> _contributorsSubject =
      StreamController<List<Contributor>>.broadcast();
  StreamController<DateTime> _cacheExpirationSubject =
      StreamController<DateTime>.broadcast();

  Stream<List<Contributor>> get contributorsStream =>
      _contributorsSubject.stream;

  Stream<DateTime> get cacheExpirationStream => _cacheExpirationSubject.stream;

  Sink<ContributorEvent> get eventSink => _eventSubject.sink;

  List<Contributor> contributors;
  String repository;

  ContributorsBloc({this.repository}) {
    this.repository = repository;

    _eventSubject.stream.listen(onEvent);
  }

  Future onEvent(ContributorEvent event) async {
    switch (event.type) {
      case ContributorEventType.initial:
        if (contributors == null) {
          apiService.fetchContributors(repository).then((contributors) {
            this.contributors = contributors;
            _contributorsSubject.add(contributors);
          });
        } else {
          _contributorsSubject.add(contributors);
        }
        break;
      case ContributorEventType.cacheLifetime:
        apiService
            .fetchCacheExpirationFor(repository)
            .then((date) => _cacheExpirationSubject.add(date));
        break;
    }
  }

  dispose() {
    _eventSubject.close();
    _contributorsSubject.close();
    _cacheExpirationSubject.close();
  }
}
