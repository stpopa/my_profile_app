import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:endava_profile_app/modules/summary/bloc/summary_content_bloc.dart';
import 'package:endava_profile_app/modules/summary/bloc/summary_content_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryHeader extends StatefulWidget {
  final String title;
  final String subtitle;

  const CategoryHeader({Key key, this.title, this.subtitle})
      : super(key: key);

  @override
  _CategoryHeaderState createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SummaryContentBloc, SummaryContentState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              Dimens.spacingSmall,
              Dimens.spacingXLarge,
              Dimens.spacingSmall,
              Dimens.spacingSmall),
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
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  '${widget.title}',
                  style: Theme.of(context).textTheme.headline,
                ),
                Visibility(
                  visible: !state.isEmpty,
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
                      // post to api
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('api call here'),
                      ));
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
