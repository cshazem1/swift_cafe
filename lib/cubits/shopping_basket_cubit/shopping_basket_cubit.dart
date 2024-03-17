import 'package:bloc/bloc.dart';
import 'package:swift_cafe/models/user_model.dart';

part 'shopping_basket_state.dart';

class ShoppingBasketCubit extends Cubit<ShoppingBasketState> {
  ShoppingBasketCubit() : super(ShoppingBasketInitial());
  List<UserModel> userModel=[];
  void getUserModel({required UserModel userModel_}){
    userModel.add(userModel_);
    emit(CategryShoppingBasketAdd());
  }
  void deleteUserModel(){
    userModel=[];
    emit(CategryShoppingBasketDelete());
  }

}
