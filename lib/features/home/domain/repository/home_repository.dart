import 'package:flutter_practice/core/common/entities/topic.dart';
import 'package:flutter_practice/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepository {
  Future<Either<Failure, Topic>> allTopics();
}
