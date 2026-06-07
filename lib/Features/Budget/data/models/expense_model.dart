import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  ExpenseModel({
    required super.description,
    required super.price,
    required super.category,
    super.spent,
    super.remaining,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
      'category': category,
      if (spent != null) 'spent': spent,
      if (remaining != null) 'remaining': remaining,
    };
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      description: description,
      price: price,
      category: category,
      spent: spent,
      remaining: remaining,
    );
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['name'],
      spent: json['spent'] ?? 0.0,
      remaining: json['remaining'] ?? 0.0,
    );
  }
}
