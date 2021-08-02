import 'package:best_wordpress_sites/home/data/models/template_model.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';

class TemplatesFixturesDatasource {
  List<Template> getTemplates(List<Map<String, dynamic>> templateData) {
    return List<Map<String, dynamic>>.from(templateData)
        .map((e) => TemplateModel.fromMap(e))
        .toList();
  }
}
