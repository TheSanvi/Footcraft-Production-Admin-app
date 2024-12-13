import 'package:firebase_admin/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/drop_down.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text('Add product'),),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
            ),
            child: SingleChildScrollView(
              //? Using SingleChildScrollView to avoid overflow when keyboard appears
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Add New Product',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Product Name',
                      hintText: 'Enter product name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productDescriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Description',
                      hintText: 'Enter product description',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productImageUrlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Image URL',
                      hintText: 'Enter product image URL',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productPriceController,
                    keyboardType: TextInputType.number, // For price, we use number type keyboard
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Price',
                      hintText: 'Enter product price',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: DropDown(
                          items: ['Sandle', 'Shoves', 'Footware'],
                          onSelected: (selected) {
                            ctrl.selectedCategory = selected ?? '';
                            ctrl.update();
                          },
                          selectedItemText: ctrl.selectedCategory,
                        ),
                      ),
                      Flexible(
                        child: DropDown(
                          items: ['Puma', 'Adidas', 'Sketchers'],
                          onSelected: (selected) {
                            ctrl.selectedBrand = selected ?? '';
                            ctrl.update();
                          },
                          selectedItemText: ctrl.selectedBrand,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Offer prodect ? '),
                  DropDown(
                    items: ['true', 'false'],
                    onSelected: (selected) {
                      ctrl.isOffer = selected == 'true';
                      ctrl.update();
                    },
                    selectedItemText: ctrl.isOffer.toString(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
