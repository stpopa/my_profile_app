import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:endava_profile_app/models/user.dart';
import './bloc.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final authService = AuthService();
  User user;

  String name;
  String role;
  String thumbnail;

  @override
  UserDataState get initialState => UserDataState.initial();

  @override
  void onTransition(Transition<UserDataEvent, UserDataState> transition) {
    print(transition);
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    print("unsaved changes? ${_hasUnsavedChanges()}");
    if (event is ScreenLoaded) {
      user = await authService.me();

      yield UserDataReceived(
        user: user,
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is NameChanged) {
      name = event.name;

      yield UserDataReceived(
        user: user,
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is RoleChanged) {
      role = event.role;

      yield UserDataReceived(
        user: user,
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is ThumbnailChanged) {
      thumbnail = event.thumbnail;

      yield UserDataReceived(
        user: user,
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is SavePressed) {
      yield initialState;

      final newState = await _save();

      yield newState;
    }
  }

  Future<UserDataReceived> _save() async {
    User userData = User(name: name, role: role, thumbnail: thumbnail);
    User updatedUser = await authService.update(userData);

    bool hasChanges = updatedUser != user;
    if (hasChanges) user = updatedUser;

    _discardLocalChanges();
    return UserDataReceived(user: user, hasChanged: hasChanges);
  }

  bool _hasUnsavedChanges() {
    return (name != null && user.name != name) ||
        (role != null && user.role != role) ||
        (thumbnail != null && user.thumbnail != thumbnail);
  }

  _discardLocalChanges() {
    name = null;
    role = null;
    thumbnail = null;
  }
}
