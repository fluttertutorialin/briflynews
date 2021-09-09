class ReadBookMarkDb {
  String? uniqueId, userId, postId, categoryId;
  int? totalReadView, isBookMark, isRead;

  ReadBookMarkDb(
      {this.uniqueId,
      this.userId,
      this.postId,
      this.categoryId,
      this.totalReadView,
      this.isBookMark,
      this.isRead});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'unique_id': uniqueId,
      'user_id': userId,
      'post_id': postId,
      'category_id': categoryId,
      'total_read_view': totalReadView,
      'is_book_mark': isBookMark,
      'is_read': isRead,
    };
    return map;
  }

  ReadBookMarkDb.fromMap(Map<String, dynamic> map) {
    uniqueId = map['unique_id'];
    userId = map['user_id'];
    postId = map['post_id'];
    categoryId = map['category_id'];
    totalReadView = map['total_read_view'];
    isBookMark = map['is_book_mark'];
    isRead = map['is_read'];
  }
}
