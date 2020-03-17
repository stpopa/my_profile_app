import 'package:endava_profile_app/modules/summary/bloc/edit_content_event.dart';
import 'package:endava_profile_app/modules/summary/bloc/summary_content_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryContentBloc extends Bloc<EditContentEvent, SummaryContentState> {
  @override
  get initialState => SummaryContentState.initial();

  @override
  Stream<SummaryContentState> mapEventToState(EditContentEvent event) async* {
    // TODO check against the field in model
    if (event.text.length == 0) {
      yield SummaryContentState.initial();
    } else {
      yield SummaryContentState.edited();
    }
  }
}
