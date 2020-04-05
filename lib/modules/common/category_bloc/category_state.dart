import 'package:endava_profile_app/models/item.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final bool isEdited;
  final bool isSaving;
  final bool isLeaving;
  final bool isLoading;
  final Item data;


  CategoryState({this.isEdited, this.isSaving, this.isLeaving, this.isLoading,
    this.data});

  factory CategoryState.initial() {
    return CategoryState(isEdited: false, isSaving: false, isLeaving: false,
        isLoading: true);
  }

  CategoryState copyWith({bool isEdited, bool saving, bool leaving, bool
  loading, Item data}) {
    return CategoryState(
        isEdited: isEdited ?? this.isEdited,
        isSaving: saving ?? this.isSaving,
        isLeaving: leaving ?? this.isLeaving,
        isLoading: loading ?? this.isLoading,
        data: data ?? this.data
    );
  }

  @override
  List<Object> get props => [isEdited, isSaving, isLeaving, isLoading, data];
}
