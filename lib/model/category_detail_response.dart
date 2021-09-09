class CategoryDetailResponse {
  String? status;
  String? message;
  List<CategoryNews>? categoryNews;

  CategoryDetailResponse({this.status, this.message, this.categoryNews});

  CategoryDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['category_news'] != null) {
      categoryNews = <CategoryNews>[];
      json['category_news'].forEach((v) {
        categoryNews!.add(new CategoryNews.fromJson(v));
      });
    }
  }
}

class CategoryNews {
  String? id;
  String? headline;
  String? imageUrl;
  String? videoUrl;
  String? contentType;
  String? date;
  String? isBreakingNews;
  String? newsDescription;
  String? courtesyUrl;
  String? courtesyTitle;
  List<Category>? category;
  List<Tags>? tags;

  CategoryNews(
      {this.id,
        this.headline,
        this.imageUrl,
        this.videoUrl,
        this.contentType,
        this.date,
        this.isBreakingNews,
        this.newsDescription,
        this.courtesyUrl,
        this.courtesyTitle,
        this.category,
        this.tags});

  CategoryNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headline = json['headline'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
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
