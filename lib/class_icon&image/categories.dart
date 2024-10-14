class Category_List {
  int? status;
  String? message;
  List<CategoryDataModel>? data;

  Category_List({this.status, this.message, this.data});

  Category_List.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryDataModel>[];
      json['data'].forEach((v) {
        data!.add(new CategoryDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryDataModel {
  int? id;
  String? name;
  String? icon;
  int? order;

  CategoryDataModel({this.id, this.name, this.icon, this.order});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['order'] = this.order;
    return data;
  }
}
