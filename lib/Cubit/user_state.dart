part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserLoading extends UserState {
  const UserLoading();
}


class UserLoaded extends UserState {
  ProfileList data;
   UserLoaded(this.data);
}


class UserError extends UserState {
  const UserError();
}
