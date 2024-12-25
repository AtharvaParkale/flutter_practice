import 'package:flutter_practice/core/common/entities/topic.dart';
import 'package:flutter_practice/core/error/exceptions.dart';
import 'package:flutter_practice/core/error/failures.dart';
import 'package:flutter_practice/features/home/data/datasources/home_local_data_source.dart';
import 'package:flutter_practice/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/src/either.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  const HomeRepositoryImpl(
    this.localDataSource,
  );

  @override
  Future<Either<Failure, List<Topic>>> allTopics() async {
    try {
      final topics = await localDataSource.getAllTopics();
      if (topics == []) {
        return left(Failure('Topics not found'));
      }
      return right(topics);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
