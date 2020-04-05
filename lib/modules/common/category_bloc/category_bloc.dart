import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_event.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_state.dart';
import 'package:endava_profile_app/modules/home/models/home_category.dart';
import 'package:endava_profile_app/services/item_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HomeCategory category;
  final _itemService = ItemService();
  Item savedItem;
  Item currentItem;

  CategoryBloc(this.category);

  @override
  get initialState => CategoryState.initial();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    // TODO check against the field in model
    if (event is CategoryLoading) {
      yield state.copyWith(loading: true);
      // TODO error handling
      savedItem = await _loadCategory();
      currentItem = savedItem;
      yield state.copyWith(loading: false, data: savedItem);
    } else if (event is CategoryEdited) {
      currentItem = event.item;
      yield state.copyWith(isEdited: true, data: currentItem);
    } else if (event is CategorySaving) {
      yield state.copyWith(loading: true, data: currentItem);
      await _saveCategory(currentItem);
      yield state.copyWith(loading: false);
    } else if (event is CategoryLeaving) {
      yield state.copyWith(loading: true, data: currentItem);
      await _saveCategory(currentItem);
      yield state.copyWith(leaving: true);
    }
  }

  Future<Item> _loadCategory() async {
    return _itemService.get(HomeCategoryData.keyFor(category));
  }

  Future<Item> _saveCategory(Item data) async {
    return _itemService.add(data);
  }
}
