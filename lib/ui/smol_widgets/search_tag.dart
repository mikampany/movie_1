import 'package:flutter/material.dart';

class SearchTag extends StatelessWidget {
  SearchTag({super.key, required this.tagName, required this.delete});
  final String tagName;
  void Function(String name) delete;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Row(
        children: [
          Text(tagName),
          IconButton(
              onPressed: () {
                delete(tagName);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      onPressed: () {},
    );
  }
}
