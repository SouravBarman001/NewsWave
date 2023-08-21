import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newswave/src/features/home/application/home_services/home_body_article.dart';

import '../../application/banner_services/home_api.dart';
import '../../domain/banner_article_model.dart';

final bodyArticleProvider = FutureProvider<List<Article>>((ref) async{
  return ref.watch(homeBodyProvider).fetchBodyArticles();
});
