class dataDoctor {
  String picture;
  String name;
  String massge;
  dataDoctor({required this.picture, required this.name, required this.massge});
}

List<dynamic> pictureList = [
  'https://preview.redd.it/k2f30ify6hx71.jpg?auto=webp&s=f4666d940c28cf0563a22bfdd13fb95bb7631686',
  'https://preview.redd.it/k2f30ify6hx71.jpg?auto=webp&s=f4666d940c28cf0563a22bfdd13fb95bb7631686',
  'https://preview.redd.it/k2f30ify6hx71.jpg?auto=webp&s=f4666d940c28cf0563a22bfdd13fb95bb7631686',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLdVIk8cxsG_9Uc2jbikFLztiafFFv13U75A&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLdVIk8cxsG_9Uc2jbikFLztiafFFv13U75A&s',
  'https://img.freepik.com/free-vector/hand-drawn-doctor-answer-questions-clipart-gesture-character_40876-3115.jpg?t=st=1727247242~exp=1727250842~hmac=eb6e5d1623d3a67c4780fff714081d1335d0db9f2c4ce0aab9f3be6933c32a1b&w=1380',
];
List<String> nameList = [
  'John Doe',
  'Jane Smith',
  'David Johnson',
  'Emily Williams',
  'Michael Jones',
  'Dr. Michael Johnson',
];
List<String> massgeList = [
  'You have to be more carefull',
  'Be patient',
  'Remember to drink plenty of water',
  'Do not forget to exercise',
  'Eat a balanced diet',
  'Drink plenty of water, eat well, and exercise regularly',
];
final List<dataDoctor> getDataDoctor = List.generate(
  pictureList.length,
  (index) => dataDoctor(
    picture: pictureList[index],
    name: nameList[index],
    massge: massgeList[index],
  ),
);
