import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_bloc.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_event.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryHeader<B extends Bloc<dynamic, dynamic>, S extends State>
    extends StatefulWidget {
  final String title;
  final String subtitle;

  const CategoryHeader({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _CategoryHeaderState createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(Dimens.spacingSmall,
              Dimens.spacingXLarge, Dimens.spacingSmall, Dimens.spacingSmall),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/arrow-back.png',
                      width: Dimens.sectionArrowWidth,
                    ),
                  ),
                  onTap: () {
                    _categoryBloc.add(CategorySaving());
                    Navigator.pop(context, state.data);
                  },
                ),
                Text(
                  '${widget.title}',
                  style: Theme.of(context).textTheme.headline,
                ),
                Visibility(
                  visible: state.isEdited,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainInteractivity: false,
                  child: GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.save,
                        color: Palette.cinnabar,
                      ),
                    ),
                    onTap: () {
                      _categoryBloc.add(CategorySaving());
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              '${widget.subtitle}',
              style: Theme.of(context).textTheme.subtitle,
              textAlign: TextAlign.center,
            )
          ]),
        );
      },
    );
  }
}
