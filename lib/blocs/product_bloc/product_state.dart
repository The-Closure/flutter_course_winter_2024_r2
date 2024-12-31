part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;

  ProductSuccess({required this.products});
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError({required this.errorMessage});
}

