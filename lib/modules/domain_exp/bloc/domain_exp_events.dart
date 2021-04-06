abstract class DomainExpEvent {}

//---------------------------------------------------------------
// Event for toggling between the Add Domain input and button
//---------------------------------------------------------------

class ToggleInput extends DomainExpEvent {
  final isEnabled;

  ToggleInput({this.isEnabled});
}

//---------------------------------------------------------------
// Event for handling any Add Domain input value change
//---------------------------------------------------------------

class InputChanged extends DomainExpEvent {
  final String title;
  final String details;

  InputChanged({this.title, this.details});
}

//---------------------------------------------------------------
// Event for handling taps that dismiss the keyboard and submit
// the current input
//---------------------------------------------------------------

class SubmitChanges extends DomainExpEvent {}

//---------------------------------------------------------------
// Event for handling any Add Domain input value change
//---------------------------------------------------------------

class DeleteEntry extends DomainExpEvent {
  final String id;
  DeleteEntry({this.id});
}

//---------------------------------------------------------------
// Save stored domain experiences to some backend
//---------------------------------------------------------------

class ToggleSave extends DomainExpEvent {}

class SaveExperiences extends DomainExpEvent {}

class UpdateEntryList extends DomainExpEvent {}