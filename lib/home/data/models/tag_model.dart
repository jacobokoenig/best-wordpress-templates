import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:flutter/material.dart';

class TagModel extends Tag {
  TagModel({
    String? id,
    required String title,
    required Color color,
  }) : super(
          id: id,
          title: title,
          color: color,
        );

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'],
      title: map['title'],
      color: colorFromString(map['color']),
    );
  }
}
