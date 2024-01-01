part of 'user_new_bloc.dart';

@immutable
abstract class UserNewState {}

class UserNewLoading extends UserNewState {}

class UserNewLoaded extends UserNewState {
  ProfileList data;
  UserNewLoaded(this.data);
}

class UsernewError extends UserNewState {}
