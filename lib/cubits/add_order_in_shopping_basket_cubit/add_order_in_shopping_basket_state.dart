part of 'add_order_in_shopping_basket_cubit.dart';

abstract class AddOrderInShoppingBasketState {}

class AddOrderInShoppingBasketInitial extends AddOrderInShoppingBasketState {}
class AddOrderInShoppingBasketLoading extends AddOrderInShoppingBasketState {}
class AddOrderInShoppingBasketSuccess extends AddOrderInShoppingBasketState {}
class AddOrderInShoppingBasketFailure extends AddOrderInShoppingBasketState {
  String message;
  AddOrderInShoppingBasketFailure(this.message);
}


