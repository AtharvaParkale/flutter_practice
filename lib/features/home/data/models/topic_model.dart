import 'package:flutter_practice/core/common/entities/topic.dart';

class TopicModel extends Topic {
  TopicModel({
    required super.id,
    required super.title,
    required super.image,
  });

  factory TopicModel.fromJson(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  TopicModel copyWith({
    String? id,
    String? title,
    String? image,
  }) {
    return TopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }
}
