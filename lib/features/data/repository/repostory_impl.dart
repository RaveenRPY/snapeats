import 'package:dartz/dartz.dart';
import 'package:snapeats/features/data/datasources/local_data_source.dart';
import 'package:snapeats/features/data/models/data_model.dart';
import 'package:snapeats/features/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;

  RepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Exception, DataModel>> getAllData() async {
    try {
      final result = await localDataSource.fetchData();
      return Right(result);
    } on Exception {
      return Left(Exception());
    }
  }
}
