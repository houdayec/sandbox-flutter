part of 'birthdate_bloc.dart';

abstract class BirthdateEvent extends Equatable {
  const BirthdateEvent();
}

class GetAge extends BirthdateEvent{

  final DateTime selectedDate;

  GetAge(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}
