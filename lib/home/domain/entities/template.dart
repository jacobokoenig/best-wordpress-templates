import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:best_wordpress_sites/home/domain/entities/tag.dart';

class Template extends Equatable {
  final String? id;
  final String templateUrl;
  final String thumbnailUrl;
  final String title;
  final String description;
  final List<Tag> tags;

  Template({
    this.id,
    required this.templateUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  List<Object?> get props => [id, templateUrl, thumbnailUrl, title, description, tags];
}
