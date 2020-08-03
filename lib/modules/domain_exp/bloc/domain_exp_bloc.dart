import 'dart:async';
import 'package:endava_profile_app/models/item.dart';
import '../models/DomainExpRepository.dart';
import '../models/DomainExperience.dart';
import 'domain_exp_events.dart';

class DomainExpBloc {
  String _titleInput;
  String _detailsInput;

  DomainExpRepository _repository = DomainExpRepository();

  StreamController<DomainExpEvent> _controller = StreamController.broadcast();

  DomainExpBloc() {
    _controller.stream.listen((event) {
      if (event is InputChanged) {
        _titleInput = event.title;
        _detailsInput = event.details;
      }
    });
  }

  void prepareInitialData(Item item) {
    print('PREPARING');
    List<DomainExperience> experiences =
        item.value.map<DomainExperience>((jsonValue) {
      return DomainExperience.fromJson(jsonValue);
    }).toList();
    _repository.initialData = List.of(experiences);
    _repository.domainExperiences = List.of(experiences);
  }

  List<DomainExperience> get items => _repository.domainExperiences;

  //---------------------------------------------------------------
  // Public sink used this for adding all domain experience events
  //---------------------------------------------------------------

  Function(DomainExpEvent) get addEvent => _controller.sink.add;

  //---------------------------------------------------------------
  // Use this for listening for all UI state changes
  //---------------------------------------------------------------

  Stream<bool> get inputToggle =>
      _controller.stream.transform(_inputToggleHandler);

  Stream<List<DomainExperience>> get experiences =>
      _controller.stream.transform(_updateListOnSubmitHandler);

  Stream<bool> get saveToggle =>
      _controller.stream.transform(_saveToggleHandler);

  Stream<bool> get loadingSpinnerToggle =>
      _controller.stream.transform(_loadingToggleHandler);

  //---------------------------------------------------------------
  // Handles the conversion between events to state
  //---------------------------------------------------------------

  StreamTransformer<DomainExpEvent, bool> get _inputToggleHandler =>
      StreamTransformer.fromHandlers(handleData: (event, sink) {
        if (event is ToggleInput) {
          sink.add(event.isEnabled);
        }
      });

  StreamTransformer<DomainExpEvent, List<DomainExperience>>
      get _updateListOnSubmitHandler =>
          StreamTransformer.fromHandlers(handleData: (event, sink) {

            if (event is UpdateEntryList) {
              sink.add(_repository.domainExperiences);
            }

            if (event is SubmitChanges) {
              _controller.sink.add(ToggleInput(isEnabled: false));

              if (_titleInput.isNotEmpty && _detailsInput.isNotEmpty) {
                final newExperience = DomainExperience.from(
                  title: _titleInput,
                  details: _detailsInput,
                );
                _repository.domainExperiences.add(newExperience);
                sink.add(_repository.domainExperiences);
                addEvent(ToggleSave());
                _titleInput = '';
                _detailsInput = '';
              }
            }

            if (event is DeleteEntry) {
              _repository.domainExperiences
                  .removeWhere((e) => e.id == event.id);
              sink.add(_repository.domainExperiences);
              addEvent(ToggleSave());
            }

          });

  StreamTransformer<DomainExpEvent, bool> get _saveToggleHandler =>
      StreamTransformer.fromHandlers(handleData: (event, sink) {
        if (event is ToggleSave) {
          print(_repository.initialData.length);
          print( _repository.domainExperiences.length);
          sink.add(_repository.initialData.length != _repository.domainExperiences.length);
        }
      });

  StreamTransformer<DomainExpEvent, bool> get _loadingToggleHandler =>
      StreamTransformer.fromHandlers(handleData: (event, sink) {
        if (event is SaveExperiences) {
          sink.add(true);

          _repository
              .saveDomainExperiences()
              .then((value) => {print(value.statusCode)})
              .catchError((error) => {print(error)})
              .whenComplete(() => {sink.add(false)});
        }
      });

  void dispose() {
    _controller.close();
  }
}
