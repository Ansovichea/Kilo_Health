import 'package:flutter/material.dart';

class Search {
  final String title;
  final List<String> images;
  final String description;

  Search(
      {required this.title, required this.images, required this.description});
}

final List<String> titles = [
  'All',
  'Kidey',
  'Lung',
  'Dentist',
  'Card',
  'Diabetes',
  'Hi',
];
final List<String> descriptions = [
  'All patients',
  'Kidney patients',
  'Lung patients',
  'Dentist patients',
  'All patients',
  'Kidney patients',
  'Lung patients',
];
final List<List<String>> categorizedImages = [
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://fileinfo.com/img/ss/xl/jpg_44-2.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
  [
    'https://tinyjpg.com/images/social/website.jpg',
    'https://tinyjpg.com/images/social/website.jpg',
  ],
];

final List<Search> searchs = List.generate(
  titles.length,
  (index) => Search(
    title: titles[index],
    images: categorizedImages[index],
    description: descriptions[index],
  ),
);
