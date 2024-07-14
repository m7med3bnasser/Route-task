part of 'products_view_model_cubit.dart';

@immutable
abstract class ProductsViewModelState {}

class ProductsViewModelInitial extends ProductsViewModelState {}

class ProductsViewModelLoading extends ProductsViewModelState {}

class ProductsViewModelSuccess extends ProductsViewModelState {
  final List<ProductsEntity> productsList;
  ProductsViewModelSuccess({required this.productsList});
}

class ProductsViewModelError extends ProductsViewModelState {
  final String? error;
  ProductsViewModelError({required this.error});
}

class SearchViewModelSuccess extends ProductsViewModelState {
  List<ProductsEntity> productDataEntity;

  SearchViewModelSuccess({required this.productDataEntity});
}