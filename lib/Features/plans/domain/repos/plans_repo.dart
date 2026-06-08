import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/core/errors/failures.dart';

abstract class PlansRepo {
  Future<Either<Failures,List<PlanModel> >> getAllPlans({required String token});
}