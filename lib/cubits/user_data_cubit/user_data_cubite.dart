import 'package:bloc/bloc.dart';
import 'package:swift_cafe/cubits/user_data_cubit/user_data_state.dart';

import '../../models/user_model.dart';

class UserDataCubit extends Cubit<UserDataState>{
  UserModel? userModel;
  UserDataCubit():super(UserDataLoading());
  void userData(UserModel userModel_){
    userModel=userModel_;
    print(userModel!.name);
    emit(UserDataSuccess());
  }
}