class CategoryResponse {
  String? status;
  String? message;
  List<Category>? category;

  CategoryResponse({this.status, this.message, this.category});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['body'] != null) {
      category = <Category>[];
      json['body'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }
}

class Category {
  String? id;
  String? categoryName;
  String? imageUrl;

  Category({this.id, this.categoryName, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    imageUrl = json['imageUrl'];
  }
}
