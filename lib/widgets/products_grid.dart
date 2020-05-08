import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_complete_guide/providers/products.dart';
class ProductsGrid extends StatelessWidget{
  final bool item;
  ProductsGrid(this.item);
  @override
  Widget build(BuildContext context){
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}