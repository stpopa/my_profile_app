import '../bloc/domain_exp_events.dart';
import '../bloc/domain_exp_provider.dart';
import 'package:flutter/material.dart';

//---------------------------------------------------------------
// TODO: REFACTOR THIS UGLY SHIT
//---------------------------------------------------------------

class AddDomainInput extends StatelessWidget {
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = DomainExpProvider.of(context);

    return Column(
      children: [
        TextField(
          onChanged: (input) => bloc.addEvent(
            InputChanged(
              title: input,
              details: _detailsController.text,
            ),
          ),
          controller: _titleController,
          maxLines: null,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: 'Domain',
            hintStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF999999),
            ),
          ),
        ),
        TextField(
          onChanged: (input) => bloc.addEvent(
            InputChanged(
              title: _titleController.text,
              details: input,
            ),
          ),
          controller: _detailsController,
          maxLines: null,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
            border: InputBorder.none,
            hintText: 'Add domain experience description',
            hintStyle: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF999999),
            ),
          ),
        ),
      ],
    );
  }
}
