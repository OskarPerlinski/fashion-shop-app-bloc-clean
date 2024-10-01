import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/domain/order/entity/product_ordered.dart';
import 'package:fashion_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:fashion_app/presentation/cart/bloc/cart_products_state.dart';
import 'package:fashion_app/presentation/cart/widgets/product_ordered_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'CART',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(child: _cartIsEmpty())
                  : Stack(
                      children: [
                        _products(state.products),
                      ],
                    );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrdereEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Cart is empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
