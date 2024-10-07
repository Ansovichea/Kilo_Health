import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.icon, required this.name});
}

final List<Category> categories = [
  Category(icon: Icons.home, name: 'Home'),
  Category(icon: Icons.star, name: 'Favorites'),
  Category(icon: Icons.settings, name: 'Settings'),
];
