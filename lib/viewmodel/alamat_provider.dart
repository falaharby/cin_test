import 'package:cin_test/model/alamat.dart';
import 'package:cin_test/repository/shared_pref.dart';
import 'package:flutter/material.dart';

class AlamatProvider extends ChangeNotifier {
  List<Alamat> _listAlamat = [];
  List<Alamat> get listAlamat => _listAlamat;

  String _query = "";
  String get query => _query;
  set query(String val) {
    _query = val;
    notifyListeners();
  }

  List<Alamat> _filteredAlamat = [];
  List<Alamat> get filteredAlamat => _filteredAlamat;

  getAlamat() async {
    _listAlamat = await SharedPref.instance.getAlamatData();

    sortAlamat();
    notifyListeners();
  }

  Future tambahAlamat(Alamat alamat) async {
    _listAlamat.add(alamat);
    SharedPref.instance.setAlamatData(_listAlamat);

    sortAlamat();
    notifyListeners();
  }

  Future editAlamat(Alamat alamat) async {
    print(alamat.id);
    _listAlamat.remove(
        _listAlamat.where((element) => element.id == alamat.id).toList()[0]);
    _listAlamat.add(alamat);
    SharedPref.instance.setAlamatData(_listAlamat);

    sortAlamat();
    notifyListeners();
  }

  Future deleteAlamat(int id) async {
    _listAlamat
        .remove(_listAlamat.where((element) => element.id == id).toList()[0]);
    print(_listAlamat);
    SharedPref.instance.setAlamatData(_listAlamat);

    sortAlamat();
    notifyListeners();
  }

  sortAlamat() {
    if (_listAlamat.isNotEmpty) {
      _listAlamat.sort((a, b) => (b.id).compareTo(a.id));
    }
  }

  // Search Function
  Future searchAlamat(String query) async {
    _filteredAlamat = await filterData(query);
    print(_filteredAlamat);
    notifyListeners();
  }

  Future<List<Alamat>> filterData(String query) async {
    final listData = _listAlamat;
    return listData.where((element) {
      // Filter by name
      final jalan = element.jalan!.toLowerCase();
      final kecamatan = element.kecamatan!.toLowerCase();
      final kelurahan = element.kelurahan!.toLowerCase();
      final kota = element.kota!.toLowerCase();
      final provinsi = element.provinsi!.toLowerCase();
      final negara = element.negara!.toLowerCase();
      final kategori = element.kategori!.toLowerCase();
      final status = element.status!.toLowerCase();
      final detail = element.detail!.toLowerCase();

      final searchLower = query.toLowerCase();

      return jalan.startsWith(searchLower) ||
          kecamatan.startsWith(searchLower) ||
          kelurahan.startsWith(searchLower) ||
          kota.startsWith(searchLower) ||
          provinsi.startsWith(searchLower) ||
          negara.startsWith(searchLower) ||
          kategori.startsWith(searchLower) ||
          status.startsWith(searchLower) ||
          detail.startsWith(searchLower);
    }).toList();
  }
}
