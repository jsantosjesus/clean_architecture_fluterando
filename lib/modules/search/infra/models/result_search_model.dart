import 'dart:convert';

import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String content;
  final String img;

  const ResultSearchModel(
      {required this.title, required this.content, required this.img});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'img': img,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
        title: map['login'], content: map['node_id'], img: map['type']);
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
