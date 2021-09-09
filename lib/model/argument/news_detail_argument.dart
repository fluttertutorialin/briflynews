import '../news_response.dart';

class NewsDetailArgument{
  int page;
  int currentPosition;
  List<NewsList> newsList;

  NewsDetailArgument({required this.page, required this.currentPosition, required this.newsList});
}