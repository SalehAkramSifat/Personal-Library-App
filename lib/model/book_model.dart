class Book {
  int? id;
  String title;
  String author;
  String description;
  int rating;
  bool isRead;

  Book({
    this.id, required this.title,
    required this.author, required this.description,
    required this.rating, required this.isRead
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'author' : author,
      'description' : description,
      'rating' : rating,
      'isRead' : isRead ? 1 : 0,
    };
  }
  factory Book.fromMap(Map<String, dynamic> map){
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      rating: map['rating'],
      isRead: map['isRead'] == 1,
    );
  }
}
