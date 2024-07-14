import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../domain/entites/product_entity.dart';
import '../../domain/usecases/get_all_product_usecase.dart';

part 'products_view_model_state.dart';

class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  ProductsViewModelCubit({required this.getAllProductUseCase})
      : super(ProductsViewModelInitial());
  GetAllProductUseCase getAllProductUseCase;
  var searchController = TextEditingController();
  List<ProductsEntity> productsList = [];
  List<ProductsEntity> productsListSearch = [];
  //? function get all Product
  void getProducts() async {
    emit(ProductsViewModelLoading());
    var either = await getAllProductUseCase.invoke();
    either.fold(
          (failure) {
        emit(ProductsViewModelError(error: failure.errorMessage));
      },
          (response) {
        productsList = response.products ?? [];
        emit(ProductsViewModelSuccess(productsList: response.products ?? []));
      },
    );
  }

  //? function search
  void searchTextInList(String text) {
    productsListSearch = productsList.where((product) {
      return product.title!.toLowerCase().contains(text.toLowerCase());
    }).toList();
    emit(SearchViewModelSuccess(productDataEntity: productsListSearch));
  }
}