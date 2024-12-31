import 'package:flutter_practice/core/error/exceptions.dart';
import 'package:flutter_practice/features/home/data/models/topic_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeLocalDataSource {
  Future<List<TopicModel>> getAllTopics();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  late final SupabaseClient supabaseClient;

  HomeLocalDataSourceImpl(this.supabaseClient);

  @override
  Future<List<TopicModel>> getAllTopics() async {
    // try {
    //   //local data
    //
    //   final userData = await supabaseClient.from('topics').select();
    //   return TopicModel.fromJson(userData);
    //
    //   // final String jsonString =
    //   //     await rootBundle.loadString('lib/core/json/all_topics.json');
    //   //
    //   // final List<dynamic> jsonList = json.decode(jsonString);
    //   //
    //   // final List<TopicModel> topics = jsonList.map((jsonItem) {
    //   //   return TopicModel.fromJson(jsonItem);
    //   // }).toList();
    //   //
    //   // return topics;
    // } catch (e) {
    //   print('Error fetching topics: $e');
    //   return [];
    // }

    try {
      final topics = await supabaseClient.from('topics').select();
      return topics
          .map(
            (blog) => TopicModel.fromJson(blog),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
