import 'dart:convert';

import 'package:cin_test/model/alamat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? preferences;

  static final SharedPref instance = SharedPref._internal();
  factory SharedPref() => instance;
  SharedPref._internal();

  Future setAlamatData(List<Alamat> alamat) async {
    try {
      preferences = await SharedPreferences.getInstance();
      var datas =
          json.encode(List<dynamic>.from(alamat.map((x) => x.toJson())));
      preferences!.setString("alamat", datas);
      print('---- ALAMAT DATA ----');
      print(preferences?.getString("alamat").toString());
    } catch (e) {
      print("Set Init Data Error : $e");
    }
  }

  Future<List<Alamat>> getAlamatData() async {
    preferences = await SharedPreferences.getInstance();
    var res = preferences?.getString("alamat");
    if (res != null) {
      var decoder = json.decode(res);
      var data = List<Alamat>.from(decoder.map((x) => Alamat.fromJson(x)));
      print(data);
      return data;
    } else {
      return [];
    }
  }

  Future dumbAlamat() async {
    preferences = await SharedPreferences.getInstance();
    await preferences?.remove('alamat');
  }
}
