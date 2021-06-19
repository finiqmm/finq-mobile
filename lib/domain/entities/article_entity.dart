import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;
  final String title;
  final String body;
  final String? coverPhoto;
  final String? publisherName;
  final String? categoryName;
  final int? createdDate;

  ArticleEntity(
      {required this.id,
      required this.title,
      required this.body,
      required this.publisherName,
      this.coverPhoto,
      this.categoryName,
      this.createdDate});

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
