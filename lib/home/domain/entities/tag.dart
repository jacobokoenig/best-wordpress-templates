import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Tag extends Equatable {
  final String id;
  final String? title;
  final Color? color;

  Tag(this.id, {this.title, this.color});

  @override
  List<Object?> get props => [id, title, color];
}
