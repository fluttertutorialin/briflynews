class NewsResponse {
  String? status;
  String? message;
  List<NewsList>? newsList;

  NewsResponse({this.status, this.message, this.newsList});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['news_list'] != null) {
      newsList = <NewsList>[];
      json['news_list'].forEach((v) {
        newsList!.add(new NewsList.fromJson(v));
      });
    }
  }
}

class SearchResponse {
  String? status;
  String? message;
  List<NewsList>? newsList;

  SearchResponse({this.status, this.message, this.newsList});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['search_result'] != null) {
      newsList = <NewsList>[];
      json['search_result'].forEach((v) {
        newsList!.add(new NewsList.fromJson(v));
      });
    }
  }
}

class NewsList {
  String? id;
  String? headline;
  String? imageUrl;
  String? contentType;
  String? date;
  String? isBreakingNews;
  String? newsDescription;
  String? courtesyUrl;
  String? courtesyTitle;
  List<Category>? category;
  List<Tags>? tags;

  NewsList(
      {this.id,
      this.headline,
      this.imageUrl,
      this.contentType,
      this.date,
      this.isBreakingNews,
      this.newsDescription,
      this.courtesyUrl,
      this.courtesyTitle,
      this.category,
      this.tags});

  NewsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headline = json['headline'];
    imageUrl = json['imageUrl'];
    contentType = json['contentType'];
    date = json['date'];
    isBreakingNews = json['isBreakingNews'];
    newsDescription = json['newsDescription'];
    courtesyUrl = json['courtesy_url'];
    courtesyTitle = json['courtesy_title'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }
}

class Category {
  String? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
  }
}

class Tags {
  String? id;
  String? tagsName;

  Tags({this.id, this.tagsName});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagsName = json['tagsName'];
  }
}
