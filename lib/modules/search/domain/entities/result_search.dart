import 'package:equatable/equatable.dart';

class ResultSearch extends Equatable {
  final String title;
  final String content;
  final String img;

  ResultSearch({required this.title, required this.content, required this.img});

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        content,
        img,
      ];
}
