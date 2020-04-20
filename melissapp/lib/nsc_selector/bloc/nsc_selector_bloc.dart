import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melissapp/infrastructure/repositories/nsc_repository.dart';

part 'nsc_selector_event.dart';
part 'nsc_selector_state.dart';

class NscSelectorBloc extends Bloc<NscSelectorEvent, NscSelectorState> {

  final NscRepository nscRepository;

  NscSelectorBloc(this.nscRepository);

  @override
  NscSelectorState get initialState => NscSelectorInitial();

  @override
  Stream<NscSelectorState> mapEventToState(
    NscSelectorEvent event,
  ) async* {
    if(event is GetNumberOfYearsOfStudies) {
      final years = await nscRepository.computeYearsOfStudies(event.numberYears);
      yield NumberOfYearsComputed(years);
    }
  }
}
