import 'package:flutter_practice/features/home/data/models/topic_model.dart';

abstract class HomeLocalDataSource {
  Future<TopicModel?> getAllTopics();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<TopicModel?> getAllTopics() async {

    // Fetch the local data -> convert to model and return
    return null;
  }
}
