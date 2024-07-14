import 'package:dartz/dartz.dart';

import '../../../domain/entites/product_entity.dart';
import '../../../domain/repository/product_remote_data_source.dart';
import '../../../helper/failures.dart';
import '../../../shared/newtwork_layer/api_manager.dart';

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failure, ResponseProductEntity>> getAllProduct() async {
    var either = await apiManager.getAllProduct();
    return either.fold(
          (l) => Left(
        Failure(errorMessage: l.errorMessage),
      ),
          (response) => Right(
        response,
      ),
    );
  }
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImp(apiManager: ApiManager.instance);
}