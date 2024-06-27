import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({
    required String author,
    required String id,
    required String content,
    required String authorSlug,
    required String dateAdded,
    required String dateModified,
    required List<dynamic> tags,
    required int length,
  }) : super(
            authorSlug: authorSlug,
            dateAdded: dateAdded,
            dateModified: dateModified,
            tags: tags,
            length: length,
            author: author,
            id: id,
            content: content);
  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["_id"],
        content: json["content"],
        authorSlug: json["authorSlug"],
        dateAdded: json["dateAdded"],
        dateModified: json["dateModified"],
        length: json["length"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "_id": id,
        "content": content,
        "authorSlug": authorSlug,
        "dateAdded": dateAdded,
        "dateModified": dateModified,
        "length": length,
        "tags": tags,
      };
}
