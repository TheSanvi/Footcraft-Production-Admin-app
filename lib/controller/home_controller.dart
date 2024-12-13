import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/model/order/item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product/product.dart';


class HomeController extends GetxController {
  // Reference to Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference orderCollection;

  List<Product> products = [];
  List<ItemOrder> orders = [];

  //? login & register text editing controller
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageUrlController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  String selectedCategory = 'Category';
  String selectedBrand = 'Brand';
  bool isOffer = true;

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('product');
    orderCollection = firestore.collection('orders');
    await fetchProducts();
    await fetchOrder();
    super.onInit();
  }

  Future<void> addProduct() async {
    try {
      DocumentReference doc = productCollection.doc();
      Product newProduct = Product(
        doc.id,
        productNameController.text,
        productDescriptionController.text,
        selectedCategory,
        productImageUrlController.text,
        isOffer,
        double.tryParse(productPriceController.text) ?? 0.0,
        selectedBrand,
      );
      //? Convert the Product instance to a JSON object
      final productJson = newProduct.toJson();
      doc.set(productJson);
      fetchProducts();
      Get.snackbar('Success', 'Product added successfully');
    } catch (error) {
      Get.snackbar('Error', 'Failed to add product: $error');
      print('Error adding product to Firestore: $error');
    }
  }

   fetchProducts() async {
    try {
      final QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts =
          productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Error loading products');
    }finally{
      update();
    }
  }

  void deleteProduct(String productId) async {
    try {
      await productCollection.doc(productId).delete();
      fetchProducts();
      Get.snackbar('Success', 'Product Deleted Successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product');
    }
  }


  fetchOrder() async {
    try {
      final QuerySnapshot productSnapshot = await orderCollection.get();
      final List<ItemOrder> retrievedProducts =
      productSnapshot.docs.map((doc) => ItemOrder.fromJson(doc.data() as Map<String, dynamic>)).toList();
      orders.clear();
      orders.assignAll(retrievedProducts);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }


}
