import 'package:fashion_app/data/auth/repository/auth_repository_impl.dart';
import 'package:fashion_app/data/auth/source/auth_firebase_service.dart';
import 'package:fashion_app/data/categories/repository/category.dart';
import 'package:fashion_app/data/categories/source/category_firebase_service.dart';
import 'package:fashion_app/data/order/repository/order.dart';
import 'package:fashion_app/data/order/source/order_firebase_service.dart';
import 'package:fashion_app/data/product/repository/product.dart';
import 'package:fashion_app/data/product/source/product_firebase_service.dart';
import 'package:fashion_app/domain/auth/repository/auth.dart';
import 'package:fashion_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:fashion_app/domain/auth/usecases/signin.dart';
import 'package:fashion_app/domain/auth/usecases/signup.dart';
import 'package:fashion_app/domain/categories/repository/category.dart';
import 'package:fashion_app/domain/categories/usecases/get_categories.dart';
import 'package:fashion_app/domain/order/repository/order.dart';
import 'package:fashion_app/domain/order/usecases/add_to_cart.dart';
import 'package:fashion_app/domain/order/usecases/get_cart_product.dart';
import 'package:fashion_app/domain/order/usecases/remove_cart_product.dart';
import 'package:fashion_app/domain/product/repository/product.dart';
import 'package:fashion_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:fashion_app/domain/product/usecases/new_items.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initialzeDependencies() async {


//services
sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImpl()
);

sl.registerSingleton<ProductFirebaseService>(
  ProductFirebaseServiceImpl()
);

sl.registerSingleton<CategoryFirebaseService>(
  CategoryFirebaseServiceImpl()
);

sl.registerSingleton<OrderFirebaseService>(
  OrderFirebaseServiceImpl()
);


//repositories
sl.registerSingleton<Authreposiotry>(
  AuthRepositoryImpl()
);

sl.registerSingleton<ProductRepository>(
  ProductRepositoryImpl()
);

sl.registerSingleton<CategoryRepository>(
  CategoryRepositoryImpl()
);

sl.registerSingleton<OrderRepository>(
  OrderRepositoryImpl()
);


//usecases
sl.registerSingleton<SignupUseCase>(
  SignupUseCase()
);

sl.registerSingleton<SigninUseCase>(
  SigninUseCase()
);

sl.registerSingleton<SendPasswordResetEmailUseCase>(
  SendPasswordResetEmailUseCase()
);

sl.registerSingleton<NewItemsUseCase>(
  NewItemsUseCase()
);

sl.registerSingleton<GetCategoriesUseCase>(
  GetCategoriesUseCase()
);

sl.registerSingleton<GetProductsByCategoryIdUseCse>(
  GetProductsByCategoryIdUseCse()
);

sl.registerSingleton<AddToCartUseCase>(
  AddToCartUseCase()
);

sl.registerSingleton<GetCartProductUseCase>(
  GetCartProductUseCase()
);

sl.registerSingleton<RemoveCartProductUseCase>(
  RemoveCartProductUseCase()
);


}