import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../api/models/category.dart';
import '../widgets/CategoryTile.dart';
import '../widgets/product_tile.dart';
import '../api/models/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Product>> _futureProducts;
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _futureProducts = apiService.fetchProducts();
  }

  void _fetchProductsByCategory(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
      _futureProducts = apiService.fetchProductsByCategory(categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Category>>(
          future: apiService.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No categories available'));
            } else {
              final categories = snapshot.data!;
              return Container(
                height: 85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _fetchProductsByCategory(categories[index].id),
                      child: CategoryTile(
                        category: categories[index],
                        isSelected: _selectedCategoryId == categories[index].id,
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: _futureProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                final products = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 2 / 3.5,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: products[index]);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
