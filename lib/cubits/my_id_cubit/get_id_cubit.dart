import 'package:bloc/bloc.dart';

import 'get_id_state.dart';

class GetIdCubit extends Cubit<GetIdState>{
  String? id;
  GetIdCubit():super(GetIdLoading());
  void getId(String id_){
    id=id_;
    emit(GetIdSuccess());
  }
}