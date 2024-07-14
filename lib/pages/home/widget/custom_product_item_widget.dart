
import 'package:flutter/material.dart';
import '../../../animation/ShimmerProductItemImage.dart';
import '../../../shared/core/utils/app_colors..dart';
import '../../../shared/core/utils/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ProductItem extends StatelessWidget {
  final String? pathImage;
  final String? descriptionImage;
  final double? price;
  final num? priceOld;
  final double? rating;

  final void Function()? onTapLove;
  final void Function()? onTapAddCard;

  const ProductItem({
    Key? key,
    required this.pathImage,
    required this.descriptionImage,
    required this.price,
    required this.onTapLove,
    required this.onTapAddCard,
    required this.priceOld,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: pathImage ?? "",
                  placeholder: (context, url) =>
                  const ShimmerProductItemImage(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: -3,
                child: InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: onTapLove,
                  child: Image.asset(
                    'assets/images/unfavourite.png',
                    width: 46,
                    height: 46,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              descriptionImage ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.textStyle12.copyWith(
                fontSize: 13,
                color: const Color(0xff06004F),
                height: 0,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text.rich(
              TextSpan(
                text: 'EGP ',
                style: AppTextStyle.textStyle14.copyWith(
                  fontSize: 14,
                  color: const Color(0xff06004F),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "$price   ",
                  ),
                  TextSpan(
                    text: " $priceOld EGP",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blueColor.withAlpha(100),
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.blueColor,
                      decorationStyle: TextDecorationStyle.solid,
                      overflow: TextOverflow.ellipsis,
                      decorationThickness: 1,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  "Review ($rating)",
                  style: const TextStyle(
                    color: Color(0xff06004F),
                  ),
                ),
                const Icon(Icons.star, color: Colors.yellow, size: 20),
                const Spacer(),
                InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: onTapAddCard,
                  child: Image.asset(
                    'assets/images/Vector.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}