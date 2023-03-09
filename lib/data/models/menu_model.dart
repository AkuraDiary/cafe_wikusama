import 'package:equatable/equatable.dart';

class MenuModel extends Equatable{
  int? idMenu;
  String? namaMenu;
  String? jenis;
  String? deskripsi;
  String? filename;
  String? path;
  int? harga;

  MenuModel(
      {this.idMenu,
        this.namaMenu,
        this.jenis,
        this.deskripsi,
        this.filename,
        this.path,
        this.harga});

  MenuModel.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    namaMenu = json['nama_menu'];
    jenis = json['jenis'];
    deskripsi = json['deskripsi'];
    filename = json['filename'];
    path = json['path'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_menu'] = this.idMenu;
    data['nama_menu'] = this.namaMenu;
    data['jenis'] = this.jenis;
    data['deskripsi'] = this.deskripsi;
    data['filename'] = this.filename;
    data['path'] = this.path;
    data['harga'] = this.harga;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

  toLowerCase() {}
}