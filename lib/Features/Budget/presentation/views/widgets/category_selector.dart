import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final Function(String) onCategorySelected;
  
  const CategorySelector({super.key, required this.onCategorySelected});
  
  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF5D5451);
    const Color fieldFillColor = Color(0xFFEBEBE3); 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _categoryController,
          onChanged: (value) {
            widget.onCategorySelected(value);
          },
          decoration: InputDecoration(
            hintText: 'Type a category...',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: fieldFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // حواف دائرية مشابهة للتصميم السابق
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }
}