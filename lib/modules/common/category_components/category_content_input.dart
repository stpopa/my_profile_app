import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_bloc.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_event.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_state.dart';
import 'package:endava_profile_app/modules/home/models/home_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryContentInput extends StatefulWidget {
  final String hintText;

  const CategoryContentInput({Key key, this.hintText}) : super(key: key);

  @override
  _CategoryContentInputState createState() => _CategoryContentInputState();
}

class _CategoryContentInputState extends State<CategoryContentInput> {
  final TextEditingController _inputFieldController = TextEditingController();
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);

    _inputFieldController.addListener(() {
      var content = _categoryBloc.currentItem?.value['value'] ?? "";
      if (_inputFieldController.text != content) {
        _categoryBloc.add(CategoryEdited(
            item: Item(
                key: "${HomeCategoryData.keyFor(_categoryBloc.category)}",
                value: {'value': _inputFieldController.text})));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        var content = _categoryBloc.currentItem?.value['value'] ?? "";
        _inputFieldController.text = content;
        _inputFieldController.selection = TextSelection.fromPosition(
            TextPosition(offset: content.length));
        return Container(
            padding: const EdgeInsets.fromLTRB(Dimens.spacingMedium, 0.0,
                Dimens.spacingMedium, Dimens.spacingMedium),
            child: TextField(
              style: Theme.of(context).textTheme.body1,
              maxLines: null,
              controller: _inputFieldController,
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Palette.lightGray),
              ),
            ));
      },
    );
  }

  @override
  void dispose() {
    _inputFieldController.dispose();
    super.dispose();
  }
}
