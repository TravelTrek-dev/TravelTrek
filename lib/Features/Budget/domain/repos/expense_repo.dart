import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';
import 'package:travel_trek/core/errors/failures.dart';

abstract class ExpenseRepo {
  Future<Either<Failures, ExpenseEntity>> addExpense({
    required ExpenseEntity expenseEntity,
    required String tripId,
  });

  Future<Either<Failures, List<ExpenseEntity>>> getExpenseHistory({required String tripId});
}
