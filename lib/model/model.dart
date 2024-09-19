class model {
  String? name;
  String? description;
  String? image;
  model({
    required this.name,
    required this.description,
    required this.image,
  });
  model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> model = new Map<String, dynamic>();
    model['name'] = this.name;
    model['description'] = this.description;
    model['image'] = this.image;
    return model;
  }
}
