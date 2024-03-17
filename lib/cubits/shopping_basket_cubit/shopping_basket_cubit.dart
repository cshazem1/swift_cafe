import 'package:bloc/bloc.dart';

import '../../models/order_models.dart';

part 'shopping_basket_state.dart';

class ShoppingBasketCubit extends Cubit<ShoppingBasketState> {
  ShoppingBasketCubit() : super(ShoppingBasketInitial());
  List<OrderModels> order=[];
  void getUserModel({required OrderModels order_}){
    order.add(order_);
    emit(CategryShoppingBasketAdd());
  }
  void deleteUserModel(){
    order=[];
    emit(CategryShoppingBasketDelete());
  }

}
