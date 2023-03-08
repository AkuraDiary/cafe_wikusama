class TransaksiDetailModel {
  String? message;
  String? idTransaksi;
  int? idMeja;
  int? idUser;
  String? namaPelanggan;
  String? status;
  String? tglTransaksi;
  List<Barang>? barang;

  TransaksiDetailModel(
      {this.message,
        this.idTransaksi,
        this.idMeja,
        this.idUser,
        this.namaPelanggan,
        this.status,
        this.tglTransaksi,
        this.barang});

  TransaksiDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    idTransaksi = json['id_transaksi'];
    idMeja = json['id_meja'];
    idUser = json['id_user'];
    namaPelanggan = json['nama_pelanggan'];
    status = json['status'];
    tglTransaksi = json['tgl_transaksi'];
    if (json['barang'] != null) {
      barang = <Barang>[];
      json['barang'].forEach((v) {
        barang!.add(new Barang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id_transaksi'] = this.idTransaksi;
    data['id_meja'] = this.idMeja;
    data['id_user'] = this.idUser;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['status'] = this.status;
    data['tgl_transaksi'] = this.tglTransaksi;
    if (this.barang != null) {
      data['barang'] = this.barang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Barang {
  int? idMenu;
  String? namaMenu;
  String? jenis;
  String? deskripsi;
  String? filename;
  int? harga;

  Barang(
      {this.idMenu,
        this.namaMenu,
        this.jenis,
        this.deskripsi,
        this.filename,
        this.harga});

  Barang.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    namaMenu = json['nama_menu'];
    jenis = json['jenis'];
    deskripsi = json['deskripsi'];
    filename = json['filename'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_menu'] = this.idMenu;
    data['nama_menu'] = this.namaMenu;
    data['jenis'] = this.jenis;
    data['deskripsi'] = this.deskripsi;
    data['filename'] = this.filename;
    data['harga'] = this.harga;
    return data;
  }
}