class Alamat {
  int id;
  String? jalan,
      kecamatan,
      kelurahan,
      kota,
      provinsi,
      negara,
      kategori,
      status,
      detail,
      kodePost,
      rt,
      rw,
      telp;

  Alamat(
      {required this.id,
      this.jalan,
      this.kecamatan,
      this.kelurahan,
      this.kota,
      this.provinsi,
      this.negara,
      this.kategori,
      this.status,
      this.kodePost,
      this.rt,
      this.rw,
      this.telp,
      this.detail});

  factory Alamat.fromJson(Map<String, dynamic> json) {
    return Alamat(
      id: json['id'],
      jalan: json['jalan'],
      kecamatan: json['kecamatan'],
      kelurahan: json['kelurahan'],
      kota: json['kota'],
      provinsi: json['provinsi'],
      negara: json['negara'],
      kategori: json['kategori'],
      status: json['status'],
      detail: json['detail'],
      kodePost: json['kodePost'],
      rt: json['rt'],
      rw: json['rw'],
      telp: json['telp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "jalan": jalan,
      "kecamatan": kecamatan,
      "kelurahan": kelurahan,
      "kota": kota,
      "provinsi": provinsi,
      "negara": negara,
      "kategori": kategori,
      "status": status,
      "detail": detail,
      "kodePost": kodePost,
      "rt": rt,
      "rw": rw,
      "telp": telp,
    };
  }
}
