import 'package:flutter/material.dart';
import 'package:yusuf_flutter_interview/controllers/itembag_controller.dart';
import 'package:yusuf_flutter_interview/controllers/product_controller.dart';
import 'package:yusuf_flutter_interview/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(proudctNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        color: KcardColour,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              child: Image.asset(product[productIndex].imgUrl),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product[productIndex].title,
                style: AppTheme.kCardTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product[productIndex].price}',
                    style: AppTheme.kCardTitle,
                  ),
                  IconButton(
                      onPressed: () {
                        ref.read(proudctNotifierProvider.notifier).isSelectItem(
                            product[productIndex].pid, productIndex);

                        if (product[productIndex].isSelected == false) {
                          ref.read(itemBagProvider.notifier).addNewItemBag(
                                ProductModel(
                                    pid: product[productIndex].pid,
                                    imgUrl: product[productIndex].imgUrl,
                                    title: product[productIndex].title,
                                    price: product[productIndex].price,
                                    longDescription:
                                        product[productIndex].longDescription,
                                    review: product[productIndex].review,
                                    rating: product[productIndex].rating),
                              );
                        } else {
                          ref
                              .read(itemBagProvider.notifier)
                              .removeItem(product[productIndex].pid);
                        }
                      },
                      icon: Icon(
                        product[productIndex].isSelected
                            ? Icons.add_box_rounded
                            : Icons.add_box_rounded,
                        size: 30,
                      ))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}