import 'package:bloc/bloc.dart';

part 'add_order_in_shopping_basket_state.dart';

class AddOrderInShoppingBasketCubit extends Cubit<AddOrderInShoppingBasketState> {
  AddOrderInShoppingBasketCubit() : super(AddOrderInShoppingBasketInitial());
}
