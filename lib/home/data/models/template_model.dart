import 'package:best_wordpress_sites/home/data/models/tag_model.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';

class TemplateModel extends Template {
  TemplateModel({
    String? id,
    required String templateUrl,
    required String thumbnailUrl,
    required String title,
    required String description,
    required List<Tag> tags,
  }) : super(
          id: id,
          templateUrl: templateUrl,
          thumbnailUrl: thumbnailUrl,
          title: title,
          description: description,
          tags: tags,
        );

  factory TemplateModel.fromMap(Map<String, dynamic> map) {
    return TemplateModel(
      id: map['id'],
      templateUrl: map['templateUrl'],
      thumbnailUrl: map['thumbnailUrl'],
      title: map['title'],
      description: map['description'],
      tags: List<Tag>.from(map['tags']?.map((x) => TagModel.fromMap(x))),
    );
  }
}
