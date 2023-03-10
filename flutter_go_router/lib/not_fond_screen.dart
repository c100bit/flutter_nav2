import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => GoRouter.of(context).go('/'),
          child: const Text('Home'),
        ),
      ),
    );
  }
}
