import 'package:flutter_practice/core/common/entities/topic.dart';
import 'package:flutter_practice/core/error/failures.dart';
import 'package:flutter_practice/core/usecase/usecase.dart';
import 'package:flutter_practice/features/home/domain/repository/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class AllTopics implements UseCase<Topic, NoParams> {
  final HomeRepository homeRepository;

  AllTopics(this.homeRepository);

  @override
  Future<Either<Failure, Topic>> call(NoParams params) async {
    return await homeRepository.allTopics();
  }
}
