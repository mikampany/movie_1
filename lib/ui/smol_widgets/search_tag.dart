import 'package:flutter/material.dart';

class SearchTag extends StatelessWidget {
  SearchTag({super.key, required this.tagName, required this.delete});
  final String tagName;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 25,
        child: FloatingActionButton(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                Text(tagName),
                IconButton(
                  onPressed: () {
                    delete();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
