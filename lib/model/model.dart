class Blog {
  int? status;
  String? message;
  List<ListBlog>? listBlog; // Renamed from data to listBlog
  Paging? paging;

  Blog({this.status, this.message, this.listBlog, this.paging});

  // JSON parsing constructor
  Blog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    // Ensure to access the correct key "data"
    if (json['data'] != null) {
      listBlog = <ListBlog>[];
      json['data'].forEach((v) {
        listBlog!.add(ListBlog.fromJson(v)); // Creating ListBlog instances
      });
    }

    // Check for paging data
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;

    // Add listBlog if it's not null
    if (listBlog != null) {
      data['data'] = listBlog!.map((v) => v.toJson()).toList();
    }

    // Add paging if it's not null
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }

    return data;
  }
}

class ListBlog {
  int? id;
  String? type;
  String? name;
  String? description;
  String? thumbnail;
  bool? favorite;
  String? createdAt;
  String? content;

  ListBlog({
    this.id,
    this.type,
    this.name,
    this.description,
    this.thumbnail,
    this.favorite,
    this.createdAt,
    this.content,
  });

  ListBlog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    favorite = json['favorite'];
    createdAt = json['createdAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['favorite'] = favorite;
    data['createdAt'] = createdAt;
    data['content'] = content;
    return data;
  }
}

class Paging {
  int? page;
  int? size;
  int? total;
  int? totalPages;

  Paging({this.page, this.size, this.total, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['size'] = size;
    data['total'] = total;
    data['totalPages'] = totalPages;
    return data;
  }
}
