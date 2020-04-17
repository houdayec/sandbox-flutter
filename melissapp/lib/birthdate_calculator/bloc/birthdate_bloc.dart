import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melissapp/infrastructure/repositories/birthdate_repository.dart';

part 'birthdate_event.dart';
part 'birthdate_state.dart';

class BirthdateBloc extends Bloc<BirthdateEvent, BirthdateState> {

  final BirthdateRepository birthdateRepository;

  BirthdateBloc(this.birthdateRepository);

  @override
  BirthdateState get initialState => BirthdateInitial();

  @override
  Stream<BirthdateState> mapEventToState(
    BirthdateEvent event,
  ) async* {
    if(event is GetAge) {
      final age = await birthdateRepository.computeAge(event.selectedDate);
      yield AgeComputed(age);
    }
  }
}
