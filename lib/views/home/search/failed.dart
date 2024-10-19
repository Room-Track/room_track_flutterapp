import 'package:flutter/material.dart';

class SearchFailed extends StatelessWidget {
  const SearchFailed({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        "The server does not respond..",
        style: TextStyle(
          color: theme.colorScheme.error,
        ),
      ),
    );
  }
}
