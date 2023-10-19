import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../datasources/datasources.dart';
import '../modal/ListModel.dart';

class Repositories{

  Future <Either<String,ProfileList>> repositories() async{

    final result= await DataSources().dataSources();
    var res;
    result.fold((l) => res=l, (r) => res=r);

    if(result.isRight()){

      return Right(ProfileList.fromJson(res));
    }
    else{
      return Left(res);
    }
  }
}