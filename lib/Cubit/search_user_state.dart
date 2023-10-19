part of 'search_user_cubit.dart';

@immutable
abstract class SearchUserState {}


class SearchUserLoading extends SearchUserState{
    SearchUserLoading();
}
class SearchUserLoaded extends SearchUserState {
  List<Data> data;
  SearchUserLoaded(this.data);
}
