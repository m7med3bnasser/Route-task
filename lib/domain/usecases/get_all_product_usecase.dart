import 'package:dartz/dartz.dart';


import '../../data/models/repository/product_repository.dart';
import '../../helper/failures.dart';
import '../entites/product_entity.dart';
import '../repository/product_repository.dart';

class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});
  Future<Either<Failure, ResponseProductEntity>> invoke() async {
    return productRepository.getAllProduct();
  }
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(productRepository: injectProductRepository());
}