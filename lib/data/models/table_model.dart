class TableModel {
  int? idMeja;
  String? nomorMeja;
  int? available;

  TableModel({this.idMeja, this.nomorMeja, this.available});

  TableModel.fromJson(Map<String, dynamic> json) {
    idMeja = json['id_meja'];
    nomorMeja = json['nomor_meja'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_meja'] = this.idMeja;
    data['nomor_meja'] = this.nomorMeja;
    data['available'] = this.available;
    return data;
  }
}