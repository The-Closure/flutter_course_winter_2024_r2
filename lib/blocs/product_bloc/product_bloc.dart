import 'package:bloc/bloc.dart';
import 'package:bloc_session_2/models/product_model.dart';
import 'package:bloc_session_2/services/product_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetAllProducts>((event, emit) async {
      emit(ProductLoading());
      List<ProductModel>? products = await ProductService().getAllProducts();
      if (products == null) {
        emit(ProductError(errorMessage: 'check internet connection'));
      } else {
        emit(ProductSuccess(products: products));
      }
    });
  }
}
