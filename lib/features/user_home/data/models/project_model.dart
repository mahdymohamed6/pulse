class ProjectModel {
  String? id;
  String? title;
  String? description;
  String? author;
  int? available;
  String? status;
  int? price;
  List<dynamic>? likes;
  List<dynamic>? comments;
  String? image;
  String? video;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProjectModel({
    this.id,
    this.title,
    this.description,
    this.author,
    this.available,
    this.status,
    this.price,
    this.likes,
    this.comments,
    this.image,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        author: json['author'] as String?,
        available: json['available'] as int?,
        status: json['status'] as String?,
        price: json['price'] as int?,
        likes: json['likes'] as List<dynamic>?,
        comments: json['comments'] as List<dynamic>?,
        image: json['image'] as String?,
        video: json['video'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'author': author,
        'available': available,
        'status': status,
        'price': price,
        'likes': likes,
        'comments': comments,
        'image': image,
        'video': video,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
