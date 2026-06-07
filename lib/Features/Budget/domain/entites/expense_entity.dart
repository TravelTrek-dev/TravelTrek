class ExpenseEntity {
  final String description;
  final double price;
  final String category;
   num? spent;
   num? remaining;

  ExpenseEntity({
    required this.description,
    required this.price,
    required this.category,
    this.spent,
    this.remaining,
  });
}
