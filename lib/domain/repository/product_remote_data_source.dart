import 'package:dartz/dartz.dart';

import '../../helper/failures.dart';
import '../entites/product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ResponseProductEntity>> getAllProduct();
}