import 'package:firebase_admin/controller/home_controller.dart'; // Adjust with your actual path
import 'package:firebase_admin/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: ()async {
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Product List"),
            actions: [IconButton(onPressed: (){
              Get.to(OrderPage());
            }, icon: Icon(Icons.request_page_outlined))],
          ),
          body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              final product = ctrl.products[index];
              return ListTile(
                title: Text(product.name ?? "No name"),
                subtitle: Text("\$${product.price.toString()}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(product.id!); // Ensure the product has an ID
                  },
                ),
              );
            },
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddProductPage()); // Navigate to the Add Product Page
            },
            child: Icon(Icons.add),
          ),
        ),
      );
    });
  }
}
