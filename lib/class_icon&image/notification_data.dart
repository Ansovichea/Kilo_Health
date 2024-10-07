class NotificationData {
  final String image;
  final String title;
  final String date;
  NotificationData(
      {required this.image, required this.title, required this.date});
}

final List<String> titles = [
  'All',
  'Kidey',
  'Lung',
  'Dentist',
];
final List<String> dates = [
  'Today',
  'Yesterday',
  '2 days ago',
  '3 days ago',
];
final List<String> images = [
  'https://media.istockphoto.com/id/1175387759/vector/camera-icon.jpg?s=612x612&w=0&k=20&c=paC1ZkU31dH2B5epXqT_cYOyca5uqh4v0WpFUldCUBE=',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Kidney_gland.svg/1200px-Kidney_gland.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Lungs_diagram.svg/1200px-Lungs_diagram.svg.png',
  'https://media.istockphoto.com/id/1175387759/vector/camera-icon.jpg?s=612x612&w=0&k=20&c=paC1ZkU31dH2B5epXqT_cYOyca5uqh4v0WpFUldCUBE=',
];

final List<NotificationData> getnotificationData = List.generate(
  titles.length,
  (index) => NotificationData(
    title: titles[index],
    date: dates[index],
    image: images[index],
  ),
);
