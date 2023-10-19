import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:regres_cubit_bloc/data/repositories/repositories.dart';

import '../data/modal/ListModel.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserLoading());

  void getUserList() async{

    emit( const UserLoading());
    try{
      final response= await Repositories().repositories();
      if(response.isRight()){
        var data;
        response.fold((l) => null, (r) => data=r);
        emit(UserLoaded(data));
      }
      else{
        emit(const UserError());
      }
    }
    catch(e){
      throw Exception(e.toString());
    }

  }
}
