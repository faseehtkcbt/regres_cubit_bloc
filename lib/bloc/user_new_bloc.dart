import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/modal/ListModel.dart';
import '../data/repositories/repositories.dart';

part 'user_new_event.dart';
part 'user_new_state.dart';

class UserNewBloc extends Bloc<UserNewEvent, UserNewState> {
  UserNewBloc() : super(UserNewLoading()) {
    on<GetUserList>((event, emit) async {
      emit(UserNewLoading());
      try {
        final response = await Repositories().repositories();
        if (response.isRight()) {
          var data;
          response.fold((l) => null, (r) => data = r);
          emit(UserNewLoaded(data));
        } else {
          emit(UsernewError());
        }
      } catch (e) {
        throw Exception(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
