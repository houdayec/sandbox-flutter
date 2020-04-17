part of 'birthdate_bloc.dart';

abstract class BirthdateState extends Equatable {
  const BirthdateState();
}

class BirthdateInitial extends BirthdateState {
  @override
  List<Object> get props => [];
}

class AgeComputed extends BirthdateState {
  final String computedAge;
  const AgeComputed(this.computedAge);
  @override
  List<Object> get props => [computedAge];
}
