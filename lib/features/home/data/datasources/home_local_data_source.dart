import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_practice/features/home/data/models/topic_model.dart';

abstract class HomeLocalDataSource {
  Future<List<TopicModel>> getAllTopics();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<TopicModel>> getAllTopics() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/core/json/all_topics.json');

      final List<dynamic> jsonList = json.decode(jsonString);

      final List<TopicModel> topics = jsonList.map((jsonItem) {
        return TopicModel.fromJson(jsonItem);
      }).toList();

      return topics;
    } catch (e) {
      print('Error fetching topics: $e');
      return [];
    }
  }
}
