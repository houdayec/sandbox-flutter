part of 'nsc_selector_bloc.dart';

abstract class NscSelectorEvent extends Equatable {
  const NscSelectorEvent();
}

class GetNumberOfYearsOfStudies extends NscSelectorEvent{
  final int numberYears;

  GetNumberOfYearsOfStudies(this.numberYears);

  @override
  List<Object> get props => null; 
}
