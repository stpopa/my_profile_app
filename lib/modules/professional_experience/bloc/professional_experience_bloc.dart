import 'package:bloc/bloc.dart';
import 'bloc.dart';

class ProfessionalExperienceBloc
    extends Bloc<ProfessionalExperienceEvent, ProfessionalExperienceState> {
  @override
  ProfessionalExperienceState get initialState =>
      ProfessionalExperienceState.initial();

  @override
  void onTransition(
      Transition<ProfessionalExperienceEvent, ProfessionalExperienceState>
          transition) {
    print(transition);
  }

  @override
  Stream<ProfessionalExperienceState> mapEventToState(
      ProfessionalExperienceEvent event) async* {
    print(event);
  }
}
