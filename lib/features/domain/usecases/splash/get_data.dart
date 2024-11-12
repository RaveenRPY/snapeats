import 'package:dartz/dartz.dart';
import 'package:snapeats/features/data/models/data_model.dart';

import '../../repository/repository.dart';
import '../usecase.dart';

class GetAllData extends UseCase<DataModel, NoParams> {
  final Repository repository;

  GetAllData({required this.repository});

  @override
  Future<Either<Exception, DataModel>> call(NoParams params) async {
    return await repository.getAllData();
  }
}
