import 'package:dartz/dartz.dart';

import '../../helper/failures.dart';
import '../entites/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ResponseProductEntity>> getAllProduct();
}