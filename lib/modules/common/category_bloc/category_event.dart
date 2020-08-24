import 'package:endava_profile_app/models/item.dart';

abstract class CategoryEvent {}

class CategoryLoading extends CategoryEvent{}

class CategoryEdited extends CategoryEvent {
  Item item;
  CategoryEdited({this.item});
}

class CategorySaving extends CategoryEvent {}

class CategoryLeaving extends CategoryEvent {}
