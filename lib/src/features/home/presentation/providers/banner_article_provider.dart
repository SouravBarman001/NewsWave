

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/banner_services/home_api.dart';
import '../../domain/banner_article_model.dart';

final bannerArticleProvider = FutureProvider<List<Article>>((ref) async{
  return ref.watch(homeBannerProvider).fetchBannerArticles();
});
