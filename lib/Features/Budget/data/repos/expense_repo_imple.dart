import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_trek/Features/Budget/data/models/expense_model.dart';
import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';
import 'package:travel_trek/Features/Budget/domain/repos/expense_repo.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/backend_service.dart';

class ExpenseRepoImple implements ExpenseRepo {
  final Api apiService;

  ExpenseRepoImple({required this.apiService});
  @override
  Future<Either<Failures, ExpenseEntity>> addExpense({
    required ExpenseEntity expenseEntity,
    required String tripId,
  }) async {
    try {
      var body = {
        'name': expenseEntity.description,
        'description': expenseEntity.description,
        'price': expenseEntity.price,
      };
      await apiService.post(
        url: '${BackendService.addExpenseUrl}$tripId?',
        body: body,
      );
      return right(expenseEntity);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ExpenseEntity>>> getExpenseHistory({
    required String tripId,
  }) async {
    List<ExpenseModel> expenseModels = [];
    try {
      Response response = await apiService.get(
        url: '${BackendService.getExpenseHistoryUrl}$tripId?',
      );

      for (var expense in response.data['value']['expenses']) {
        expenseModels.add(ExpenseModel.fromJson(expense));
      }
      return right(expenseModels);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
