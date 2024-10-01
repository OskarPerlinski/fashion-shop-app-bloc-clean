import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:fashion_app/presentation/home/product_detail/bloc/product_selection_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Size',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlocBuilder<ProductSizeSelectionCubit, int>(
                    builder: (context, state) => GestureDetector(
                      onTap: () {
                        context
                            .read<ProductSizeSelectionCubit>()
                            .itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: state == index
                                ? Colors.green
                                : Colors.brown,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.sizes[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            state == index
                                ? const Icon(
                                    Icons.check,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                : Container(
                                    width: 30,
                                  )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: productEntity.sizes.length),
          ),
        ],
      ),
    );
  }
}