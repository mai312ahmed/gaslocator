import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String id;
  final String content;
  final String authorSlug;
  final String dateAdded;
  final String dateModified;
  final int length;
  final List<dynamic> tags;
  const Quote({
    required this.authorSlug,
    required this.dateAdded,
    required this.dateModified,
    required this.tags,
    required this.length,
    required this.author,
    required this.id,
    required this.content,
  });

  @override
  List<Object?> get props =>
      [author, id, content, authorSlug, dateAdded, dateModified, length, tags];
}
