import 'package:flutter/material.dart';
import '../api/models/product.dart';
import 'product_detail_screen.dart';
import '../api/api_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<List<Product>>? _futureProducts;

  void _onSearchChanged() {
    setState(() {
      _futureProducts = ApiService.searchProducts(_controller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  void _navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Container(
              height: 60,
              color: Colors.black12,
              child: Row(
                children: [
                  SizedBox(width: 16,),
                  Icon(Icons.arrow_back, size: 24),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter product name',
                        border: InputBorder.none, // Loại bỏ đường viền
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No products found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return ListTile(
                          leading:Container(
                            padding: EdgeInsets.only(right: 10.0), // Thêm padding bên phải
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0), // Bo góc cho hình ảnh
                              child: Image.network(
                                product.img,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                          title: Text(product.name,style: TextStyle(color: Colors.grey),),
                          subtitle: Text('${product.price} USD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          onTap: () => _navigateToProductDetail(product),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
