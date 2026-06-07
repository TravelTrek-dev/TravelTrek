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
    required String userToken,
  }) async {
    try {
      var body = {
        'name': expenseEntity.category,
        'description': expenseEntity.description,
        'price': expenseEntity.price,
      };

      await apiService.post(
        url: '${BackendService.addExpenseUrl}$tripId?',
        body: body,
        token: userToken,
      );
      return right(expenseEntity);
    } on Exception catch (e) {
      return left(throw ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ExpenseEntity>>> getExpenseHistory({
    required String tripId,
    required String userToken,
  }) async {
    List<ExpenseModel> expenseModelsList = [];
    try {
      Response response = await apiService.get(
        url: '${BackendService.getExpenseHistoryUrl}$tripId?',
        token: userToken,
      );

      for (var expense in response.data['value']['expenses']) {
        expenseModelsList.add(ExpenseModel.fromJson(expense));
      }

      for (var expense in expenseModelsList) {
        expense.spent = response.data['value']['spent'];
        expense.remaining = response.data['value']['remaining'];
      }
      return right(expenseModelsList);
    } on Exception catch (e) {
      return left(throw ServerFailure(errorMessage: e.toString()));
    }
  }
}
