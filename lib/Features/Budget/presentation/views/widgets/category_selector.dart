import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String selectedCategory = 'Food & Dining';

  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF5D5451); // اللون الغامق للنصوص
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildCategoryChip(
                icon: Icons.restaurant,
                label: 'Food & Dining',
              ),
              _buildCategoryChip(
                icon: Icons.flight,
                label: 'Flights',
              ),
              _buildCategoryChip(
                icon: Icons.hotel,
                label: 'Accommodation',
              ),

              _buildCategoryChip(
                icon: Icons.shopping_bag,
                label: 'Activities',
              ),
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip({required IconData icon, required String label}) {
    bool isSelected = selectedCategory == label;

    Color bgColor = isSelected ? const Color(0xFF6B5E5E) : const Color(0xFFEBEBE3);
    Color contentColor = isSelected ? Colors.white : const Color(0xFF5D5451);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: isSelected ? null : Border.all(color: const Color(0xFFD1D1C6).withValues(alpha: .5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: contentColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: contentColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
