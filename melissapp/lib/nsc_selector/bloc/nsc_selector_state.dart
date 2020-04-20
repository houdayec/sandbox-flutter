part of 'nsc_selector_bloc.dart';

abstract class NscSelectorState extends Equatable {
  const NscSelectorState();
}

class NscSelectorInitial extends NscSelectorState {
  @override
  List<Object> get props => [];
}

class NumberOfYearsComputed extends NscSelectorState {
  final String numberOfYearsFormatted;
  const NumberOfYearsComputed(this.numberOfYearsFormatted);

  @override
  List<Object> get props => null;
}
