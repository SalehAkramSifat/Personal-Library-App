class Book {
  int? id;
  String title;
  String author;
  String description;
  int rating;
  bool isRead;

  Book({
    required this.id, required this.title,
    required this.author, required this.description,
    required this.rating, required this.isRead
  });

  Map<String, dynamic> fromMap() {
    return {
      'id' : id,
      'title' : title,
      'author' : author,
      'description' : description,
      'rating' : rating,
      'isRead' : isRead,
    };
  }
  factory Book.fromMap(Map<String, dynamic> map){
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      rating: map['rating'],
      isRead: map['isRead'],
    );
  }
}
