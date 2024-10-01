import 'package:fashion_app/common/bloc/button/button_state.dart';
import 'package:fashion_app/common/bloc/button/button_state_cubit.dart';
import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/common/widgets/button/basic_reactive_button.dart';
import 'package:fashion_app/data/order/models/add_to_cart_req.dart';
import 'package:fashion_app/domain/order/usecases/add_to_cart.dart';
import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:fashion_app/presentation/cart/pages/cart.dart';
import 'package:fashion_app/presentation/home/product_detail/bloc/product_selection_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBasket extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBasket({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecase: AddToCartUseCase(),
                params: AddToCartReq(
                  productId: productEntity.productId,
                  productTitle: productEntity.title,
                  productSize: productEntity.sizes[
                      context.read<ProductSizeSelectionCubit>().selectedIndex],
                  productPrice: productEntity.price.toDouble(),
                  productImage: productEntity.image[0],
                  createdDate: DateTime.now().toString(),
                ));
          },
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Icon(Icons.add, color: Colors.white),
              Text(
                'ADD TO BASKET',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}