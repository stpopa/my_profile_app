import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/modules/home/bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:endava_profile_app/services/item_service.dart';
import '../../../models/user.dart';
import '../../../models/item.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService authService = AuthService();
  final ItemService itemService = ItemService();

  @override
  HomeState get initialState => HomeState.initial();

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    print(transition);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SectionSelected) {

    } else if (event is ScreenLoaded) {
      yield HomeLoading();

      User currentUser = await authService.me();
      List<Item> items = await itemService.getAll();
      // also fetch and map items here

      yield HomeSuccessResponse(currentUser: currentUser, items: items);
    }
  }

}
