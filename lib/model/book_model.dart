class Book {
  int id?;
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
}