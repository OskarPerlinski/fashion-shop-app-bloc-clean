import 'package:bloc/bloc.dart';
import 'package:fashion_app/domain/product/usecases/new_items.dart';
import 'package:fashion_app/presentation/home/bloc/new_item_display_state.dart';
import 'package:fashion_app/service_locator.dart';

class NewItemDisplayCubit extends Cubit<NewItemDisplayState> {
  NewItemDisplayCubit() : super(ProductsLoading());

  void displayProducts() async {
    var returnedData = await sl<NewItemsUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadProductsFailure()
        );
      },
      (data){
        emit(
          ProductsLoaded(products: data)
        );
      },
    );
  }

  
}