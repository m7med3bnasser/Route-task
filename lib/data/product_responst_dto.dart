import '../../domain/entites/product_entity.dart';

class ResponseProductDto extends ResponseProductEntity {
  ResponseProductDto({super.products, super.total, super.skip, super.limit});

  ResponseProductDto.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsDto>[];
      json['products'].forEach((v) {
        products!.add(new ProductsDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class ProductsDto extends ProductsEntity {
  ProductsDto(
      {super.id,
        super.title,
        super.description,
        super.category,
        super.price,
        super.discountPercentage,
        super.rating,
        super.stock,
        super.tags,
        super.brand,
        super.sku,
        super.weight,
        super.dimensions,
        super.warrantyInformation,
        super.shippingInformation,
        super.availabilityStatus,
        super.reviews,
        super.returnPolicy,
        super.minimumOrderQuantity,
        super.meta,
        super.images,
        super.thumbnail});

  ProductsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new DimensionsDto.fromJson(json['dimensions'])
        : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = <ReviewsDto>[];
      json['reviews'].forEach((v) {
        reviews!.add(new ReviewsDto.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? new MetaDto.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }
}

class DimensionsDto extends DimensionsEntity {
  DimensionsDto({super.width, super.height, super.depth});

  DimensionsDto.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
}

class ReviewsDto extends ReviewsEntity {
  ReviewsDto(
      {super.rating,
        super.comment,
        super.date,
        super.reviewerName,
        super.reviewerEmail});

  ReviewsDto.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }
}

class MetaDto extends MetaEntity {
  MetaDto({super.createdAt, super.updatedAt, super.barcode, super.qrCode});

  MetaDto.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
}