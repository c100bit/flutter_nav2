import 'package:flutter/material.dart';
import 'package:flutter_nav2/books_repository.dart';
import 'package:go_router/go_router.dart';

class BooksListScreen extends StatelessWidget {
  final books = BooksRepository().finAll();
  final String booksStorage;

  BooksListScreen({
    super.key,
    required this.booksStorage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(booksStorage.toUpperCase()),
      ),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => GoRouter.of(context).go('/$booksStorage/${book.id}'),
            )
        ],
      ),
    );
  }
}
