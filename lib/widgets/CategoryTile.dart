import 'package:flutter/material.dart';
import '../api/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final bool isSelected;

  CategoryTile({required this.category, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 30, 5),
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.black12,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                category.img,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error); // Icon hiển thị nếu hình ảnh không tải được
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
