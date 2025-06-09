import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _apiService.getProducts();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await _apiService.createProduct(product);
    await fetchProducts();
  }

  Future<void> updateProduct(int id, Product product) async {
    await _apiService.updateProduct(id, product);
    await fetchProducts();
  }

  Future<void> deleteProduct(int id) async {
    await _apiService.deleteProduct(id);
    await fetchProducts();
  }
}
