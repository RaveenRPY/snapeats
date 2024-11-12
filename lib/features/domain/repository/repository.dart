import 'package:dartz/dartz.dart';
import 'package:snapeats/features/data/models/data_model.dart';

abstract class Repository {
  Future<Either<Exception,DataModel>> getAllData();
}