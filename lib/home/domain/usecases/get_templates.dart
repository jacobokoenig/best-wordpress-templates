import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/repositories/templates_repository.dart';

class GetTemplates {
  TemplatesRepository templatesRepository;

  GetTemplates(this.templatesRepository);

  Future<List<Template>> call() {
    return templatesRepository.getTemplates();
  }
}
