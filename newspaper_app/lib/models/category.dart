import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imagetext;
  final String webLink;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    required this.imagetext,
    required this.webLink
  });
}
