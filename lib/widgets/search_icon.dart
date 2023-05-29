import 'package:flutter/material.dart';

class IconSearch extends StatelessWidget {
  const IconSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(13)),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
