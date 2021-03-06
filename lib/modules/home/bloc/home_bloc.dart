import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/modules/home/bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:endava_profile_app/services/item_service.dart';

import '../../../models/item.dart';
import '../../../models/user.dart';
import 'package:endava_profile_app/common/constants.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService authService = AuthService();
  final ItemService itemService = ItemService();

  User _currentUser;
  List<Item> _items;

  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SectionSelected) {
      if (event.category == AppScreen.userData)
        print(event.category);
    } else if (event is ScreenLoaded) {
      yield HomeLoading();

      _currentUser = await authService.me();
      _items = await itemService.getAll();
      // also fetch and map items here

      yield HomeSuccessResponse(currentUser: _currentUser, items: _items);
    } else if (event is Logout) {
      yield HomeLoading();

      final success = await authService.logout();

      if (success)
        yield ReplaceHomeRoute(replaceRoute: AppScreen.auth);
      else
        yield initialState;
    }
  }

  void _updateItems(Item item) {
    int index = _items.indexWhere((element) => element.key == item.key);
    _items.replaceRange(index, index + 1, [item]);
  }
}
