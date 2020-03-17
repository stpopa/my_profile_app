import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:endava_profile_app/modules/summary/bloc/edit_content_event.dart';
import 'package:endava_profile_app/modules/summary/bloc/summary_content_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentInput extends StatefulWidget {
  final String hintText;

  const ContentInput({Key key, this.hintText}) : super(key: key);
  @override
  _ContentInputState createState() => _ContentInputState();
}

class _ContentInputState extends State<ContentInput> {
  final TextEditingController _inputFieldController = TextEditingController();
  SummaryContentBloc _summaryBloc;

  @override
  void initState() {
    super.initState();

    _summaryBloc = BlocProvider.of<SummaryContentBloc>(context);

    _inputFieldController.addListener(() {
      _summaryBloc.add(EditContentEvent(_inputFieldController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(Dimens.spacingMedium, 0.0,
            Dimens.spacingMedium, Dimens.spacingMedium),
        child: TextField(
            style: Theme.of(context).textTheme.body1,
            maxLines: null,
            controller: _inputFieldController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Palette.lightGray),
            )));
  }

  @override
  void dispose() {
    _inputFieldController.dispose();
    super.dispose();
  }
}
