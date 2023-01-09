class MapelList {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<MappelList>? items;

  MapelList(
      {this.page, this.perPage, this.totalItems, this.totalPages, this.items});

  MapelList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <MappelList>[];
      json['items'].forEach((v) {
        items!.add(new MappelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    data['totalItems'] = this.totalItems;
    data['totalPages'] = this.totalPages;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MappelList {
  String? collectionId;
  String? collectionName;
  String? courseCategory;
  String? courseName;
  String? created;
  String? id;
  int? jumlahDone;
  int? jumlahMateri;
  String? majorName;
  int? progress;
  String? updated;
  String? urlCover;

  MappelList(
      {this.collectionId,
      this.collectionName,
      this.courseCategory,
      this.courseName,
      this.created,
      this.id,
      this.jumlahDone,
      this.jumlahMateri,
      this.majorName,
      this.progress,
      this.updated,
      this.urlCover});

  MappelList.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    courseCategory = json['course_category'];
    courseName = json['course_name'];
    created = json['created'];
    id = json['id'];
    jumlahDone = json['jumlah_done'];
    jumlahMateri = json['jumlah_materi'];
    majorName = json['major_name'];
    progress = json['progress'];
    updated = json['updated'];
    urlCover = json['url_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['course_category'] = this.courseCategory;
    data['course_name'] = this.courseName;
    data['created'] = this.created;
    data['id'] = this.id;
    data['jumlah_done'] = this.jumlahDone;
    data['jumlah_materi'] = this.jumlahMateri;
    data['major_name'] = this.majorName;
    data['progress'] = this.progress;
    data['updated'] = this.updated;
    data['url_cover'] = this.urlCover;
    return data;
  }
}
