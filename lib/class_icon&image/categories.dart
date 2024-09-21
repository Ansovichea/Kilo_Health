import 'package:flutter/material.dart';
class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}
final List<Category> categories = [
  Category('All', Icons.all_inbox_rounded),
  Category('Kidney', Icons.keyboard_option_key),
  Category('Lung', Icons.book),
  Category('Gast', Icons.sports_soccer),
];
