import 'package:best_wordpress_sites/home/domain/entities/template.dart';

abstract class TemplatesRepository {
  Future<List<Template>> getTemplates();
}
