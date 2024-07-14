import 'package:flutter/material.dart';
import 'package:task_route/pages/home/widget/custom_product_item_widget.dart';
import 'package:task_route/pages/home/widget/custom_text_form_widget.dart';
import 'package:task_route/shared/custom_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../animation/ShimmerProductScreen.dart';
import '../../domain/entites/product_entity.dart';
import '../../domain/usecases/get_all_product_usecase.dart';
import '../../shared/core/utils/app_text_style.dart';
import '../view_model/products_view_model_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductsViewModelCubit viewModel = ProductsViewModelCubit(
      getAllProductUseCase: injectGetAllProductUseCase());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   viewModel.getProducts();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.searchController.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //? section search
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWidget(
                      controller: viewModel.searchController,
                      myValidator: (text) => null,
                      keyboardType: TextInputType.text,
                      onChanged: (text) {
                        viewModel.searchTextInList(text);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Image.asset(
                      "assets/images/icon_shopping cart_.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),

              BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
                bloc: viewModel..getProducts(),
                builder: (context, state) {
                  if (state is ProductsViewModelError) {
                    return Center(
                      child: Text(
                        state.error ?? "",
                        style: AppTextStyle.textStyle16,
                      ),
                    );
                  }

                  if (state is ProductsViewModelSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        20.height,
                        //? section products
                        _gridViewProductWidget(context, viewModel.productsList),
                      ],
                    );
                  }
                  if (state is SearchViewModelSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        20.height,
                        //? section search
                        _gridViewProductWidget(
                            context, viewModel.productsListSearch),
                      ],
                    );
                  }
                  return const ShimmerProductScreen();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _gridViewProductWidget(
    BuildContext context,
    List<ProductsEntity> productsList,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.79,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.80590,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            priceOld: productsList[index].discountPercentage,
            descriptionImage: productsList[index].title,
            pathImage: productsList[index].images?[0],
            onTapAddCard: () {},
            onTapLove: () {},
            price: productsList[index].price,
            rating: productsList[index].rating,
          );
        },
        itemCount: productsList.length,
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: Image.asset(
        "assets/images/title.png",
        height: 25,
        width: 50,
      ),
    );
  }
}
