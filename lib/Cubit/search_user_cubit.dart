import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/modal/ListModel.dart';

part 'search_user_state.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  SearchUserCubit() : super(SearchUserLoading());

  void searchUser( List <Data> data,String search){
    emit(SearchUserLoading());
    List<Data> searchList=[];
    for(int i=0;i<data.length;i++){
      if(data[i].firstName!.toLowerCase().contains(search.toLowerCase()) || data[i].lastName!.toLowerCase().contains(search.toLowerCase()) ){
        searchList.add(data[i]);
      }
    }
    emit(SearchUserLoaded(searchList));

  }

}
