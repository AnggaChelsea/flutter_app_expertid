class UserByEmail {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<UserData>? items;

  UserByEmail(
      {this.page, this.perPage, this.totalItems, this.totalPages, this.items});

  UserByEmail.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <UserData>[];
      json['items'].forEach((v) {
        items!.add(new UserData.fromJson(v));
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

class UserData {
  String? collectionId;
  String? collectionName;
  String? created;
  String? email;
  String? id;
  String? jeniskelamin;
  String? nama;
  String? namasekolah;
  String? updated;
  int? usia;

  UserData(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.email,
      this.id,
      this.jeniskelamin,
      this.nama,
      this.namasekolah,
      this.updated,
      this.usia});

  UserData.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    email = json['email'];
    id = json['id'];
    jeniskelamin = json['jeniskelamin'];
    nama = json['nama'];
    namasekolah = json['namasekolah'];
    updated = json['updated'];
    usia = json['usia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['created'] = this.created;
    data['email'] = this.email;
    data['id'] = this.id;
    data['jeniskelamin'] = this.jeniskelamin;
    data['nama'] = this.nama;
    data['namasekolah'] = this.namasekolah;
    data['updated'] = this.updated;
    data['usia'] = this.usia;
    return data;
  }
}
