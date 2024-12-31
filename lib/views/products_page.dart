import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/product_bloc/product_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetAllProducts()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccess) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(state.products[index].thumbnail),
                      title: Text(state.products[index].title),
                      subtitle: Text(state.products[index].description),
                      trailing: CircleAvatar(
                        child: Text(
                          state.products[index].id.toString(),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ProductError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
