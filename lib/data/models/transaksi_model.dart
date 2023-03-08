class TransaksiModel {
  int? idTransaksi;
  String? tglTransaksi;
  int? idUser;
  int? idMeja;
  String? namaPelanggan;
  String? status;

  TransaksiModel(
      {this.idTransaksi,
        this.tglTransaksi,
        this.idUser,
        this.idMeja,
        this.namaPelanggan,
        this.status});

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['id_transaksi'];
    tglTransaksi = json['tgl_transaksi'];
    idUser = json['id_user'];
    idMeja = json['id_meja'];
    namaPelanggan = json['nama_pelanggan'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_transaksi'] = this.idTransaksi;
    data['tgl_transaksi'] = this.tglTransaksi;
    data['id_user'] = this.idUser;
    data['id_meja'] = this.idMeja;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['status'] = this.status;
    return data;
  }
}