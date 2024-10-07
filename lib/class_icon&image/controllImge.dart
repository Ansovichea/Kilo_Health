class HomescreenData {
  String title;
  String image;
  String description;
  HomescreenData(
      {required this.title, required this.image, required this.description});
}

final List<String> titles = [
  'Treatments',
  'Specialists',
  'Lung Diseases',
  'Treatments',
];
final List<String> descriptions = [
  'View all treatments',
  'Find a specialist in Kidney care',
  'Learn about lung diseases',
  'View all treatments',
];
final List<String> images = [
  'https://img.freepik.com/free-photo/digital-art-beautiful-mountains_23-2151123686.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/025/067/762/small/4k-beautiful-colorful-abstract-wallpaper-photo.jpg',
  'https://marketplace.canva.com/EAE-xnqWvJk/1/0/1600w/canva-retro-smoke-and-round-light-desktop-wallpapers-JLofAI27pCg.jpg',
  'https://i0.wp.com/i.ebayimg.com/images/g/zV4AAOSwIMJkSA-e/s-l1200.jpg'
];

final List<HomescreenData> getHomescreen = List.generate(
  titles.length,
  (index) => HomescreenData(
    title: titles[index],
    description: descriptions[index],
    image: images[index],
  ),
);
