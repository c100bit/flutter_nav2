import 'book.dart';

class BooksRepository {
  static final _instance = BooksRepository._();

  BooksRepository._();

  final _books = <Book>[
    Book(1, 'Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book(2, 'Too Like the Lightning', 'Ada Palmer'),
    Book(3, 'Kindred', 'Octavia E. Butler'),
  ];

  factory BooksRepository() => _instance;

  List<Book> finAll() => _books;
  Book findOne(int id) => _books.firstWhere((book) => book.id == id);
}
