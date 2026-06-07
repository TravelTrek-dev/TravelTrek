import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  ExpenseModel({
    required super.description,
    required super.price,
    required super.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
      'category': category,
    };
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      description: description,
      price: price,
      category: category,
    );
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
    );
  }
}
