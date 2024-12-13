import 'package:firebase_admin/controller/home_controller.dart'; // Adjust with your actual path
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_product_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchOrder();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Order List"),
          ),
          body: ListView.builder(
            itemCount: ctrl.orders.length,
            itemBuilder: (context, index) {
              final order = ctrl.orders[index];
              return ListTile(
                title: Text(order.item ?? "No Item"),
                subtitle: Text("${order.customer} -- ${order.dateTime}"),
                isThreeLine: true,
                trailing: IconButton(
                  icon: Text(
                    (order.price ?? 0).toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    ctrl.deleteProduct(order.id!); // Ensure the product has an ID
                  },
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
