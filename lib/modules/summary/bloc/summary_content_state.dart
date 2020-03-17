import 'package:equatable/equatable.dart';

class SummaryContentState extends Equatable {
  final bool isEmpty;

  SummaryContentState(this.isEmpty);

  factory SummaryContentState.initial() {
    return SummaryContentState(true);
  }

  factory SummaryContentState.edited() {
    return SummaryContentState(false);
  }

  @override
  List<Object> get props => [isEmpty];

}
