import 'dart:async';
import '../../services/github_service.dart';
import '../../models/contributor.dart';
import '../../models/user.dart';

enum ContributorCardEventType { initial }

class ContributorCardEvent {
  ContributorCardEventType type;
  dynamic value;

  ContributorCardEvent(this.type, {this.value});
}

class ContributorCardBloc {
  final apiService = GithubService();

  StreamController<ContributorCardEvent> _eventSubject =
      StreamController<ContributorCardEvent>.broadcast();

  StreamController<User> _userSubject = StreamController<User>.broadcast();

  Stream<User> get userStream => _userSubject.stream;

  Sink<ContributorCardEvent> get eventSink => _eventSubject.sink;

  User user;

  ContributorCardBloc() {
    _eventSubject.stream.listen(onEvent);
  }

  Future onEvent(ContributorCardEvent event) async {
    switch (event.type) {
      case ContributorCardEventType.initial:
        Contributor contributor = event.value;

        if (user == null) {
          apiService.fetchUser(contributor.url).then((user) {
            this.user = user..contributions = contributor.contributions;
            _userSubject.add(this.user);
          });
        } else {
          _userSubject.add(user);
        }
        break;
    }
  }

  dispose() {
    _eventSubject.close();
    _userSubject.close();
  }
}
