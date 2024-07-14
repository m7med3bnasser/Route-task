import 'package:dartz/dartz.dart';

import '../../../domain/entites/product_entity.dart';
import '../../../domain/repository/product_remote_data_source.dart';
import '../../../domain/repository/product_repository.dart';
import '../../../helper/failures.dart';
import '../data_source/product_remote_datasource.dart';
class ProductRepositoryImp implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImp({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, ResponseProductEntity>> getAllProduct() {
    return productRemoteDataSource.getAllProduct();
  }
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImp(
    productRemoteDataSource: injectProductRemoteDataSource(),
  );
}