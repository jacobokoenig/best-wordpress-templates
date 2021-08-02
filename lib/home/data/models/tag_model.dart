import 'package:best_wordpress_sites/home/domain/entities/tag.dart';

class TagModel extends Tag {
  TagModel(String id) : super(id);

  factory TagModel.fromMap(Map<String, dynamic> map) {
    if (map['id'] == null) throw Exception('No id passed on to Tag Model');
    return TagModel(map['id']);
  }
}
