import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:best_wordpress_sites/home/domain/entities/tag.dart';

class Template extends Equatable {
  final String? id;
  final String templateUrl;
  final String thumbnailUrl;
  final String title;
  final String description;
  final String owner;
  final List<Tag> tags;

  Template({
    this.id,
    required this.templateUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
    required this.owner,
    required this.tags,
  });

  @override
  List<Object?> get props => [id, templateUrl, thumbnailUrl, title, description, tags];

  Template copyWith({
    String? id,
    String? templateUrl,
    String? thumbnailUrl,
    String? title,
    String? description,
    String? owner,
    List<Tag>? tags,
  }) {
    return Template(
      id: id ?? this.id,
      templateUrl: templateUrl ?? this.templateUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
    );
  }
}
