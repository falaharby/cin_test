import 'package:cin_test/model/alamat.dart';
import 'package:cin_test/view/widget/alert_component.dart';
import 'package:cin_test/view/widget/component.dart';
import 'package:cin_test/view/widget/form_component.dart';
import 'package:cin_test/viewmodel/alamat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPhoneComponent extends StatefulWidget {
  final VoidCallback? onTap;
  final Alamat? updateData;
  const AddPhoneComponent({super.key, this.onTap, this.updateData});

  @override
  State<AddPhoneComponent> createState() => _AddPhoneComponentState();
}

class _AddPhoneComponentState extends State<AddPhoneComponent> {
  bool changeColor = false;
  String? valKategori;
  List<String> listKategori = ['A', 'B', 'C'];
  String? valNegara;
  List<String> listNegara = ['Indonesia', 'Malaysia', 'Singapura'];
  String? valProvinsi;
  List<String> listProvinsi = ['Jawa Tengah', 'Jawa Timur', 'Yogyakarta'];
  String? valKota;
  List<String> listKota = ['Semarang', 'Surabaya', 'Yogyakarta'];
  String? valKecamatan;
  List<String> listKecamatan = ['Ngaliyan', 'Gunung Anyar', 'Bantul'];
  String? valKelurahan;
  List<String> listKelurahan = ['Wonosari', 'Dukuh Setro', 'Banguntapan'];
  String? valKodePos;
  List<String> listKodePos = ['4012', '5237', '8423'];
  String? rt, rw, jalan, telp;
  bool isActive = false;

  @override
  void initState() {
    if (widget.updateData != null) {
      initData();
    }
    super.initState();
  }

  initData() {
    valKategori = widget.updateData?.kategori;
    valNegara = widget.updateData?.negara;
    valProvinsi = widget.updateData?.provinsi;
    valKota = widget.updateData?.kota;
    valKecamatan = widget.updateData?.kecamatan;
    valKelurahan = widget.updateData?.kelurahan;
    valKodePos = widget.updateData?.kodePost;
    telp = widget.updateData?.telp;
    rt = widget.updateData?.rt;
    rw = widget.updateData?.rw;
    jalan = widget.updateData?.jalan;
    isActive = widget.updateData?.status == "Active" ? true : false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFF6F6F7),
      insetPadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 190,
        color: const Color(0xFFF6F6F7),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormComponent(
                      isDropdown: true,
                      label: 'Kategori',
                      value: valKategori,
                      onChanged: (value) {
                        setState(() {
                          valKategori = value.toString();
                        });
                      },
                      listData: listKategori,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FormComponent(
                      isDropdown: true,
                      label: 'Negara',
                      value: valNegara,
                      onChanged: (value) {
                        setState(() {
                          valNegara = value.toString();
                        });
                      },
                      listData: listNegara,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all<Color>(isActive
                                ? Colors.blue
                                : Colors.grey[400] as Color),
                            side: const BorderSide(color: Colors.grey),
                            value: isActive,
                            onChanged: (bool? value) {
                              setState(() {
                                isActive = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Active',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    FormComponent(
                      isDropdown: true,
                      label: 'Provinsi',
                      value: valProvinsi,
                      onChanged: (value) {
                        setState(() {
                          valProvinsi = value.toString();
                        });
                      },
                      listData: listProvinsi,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FormComponent(
                      isDropdown: true,
                      label: 'Kota',
                      value: valKota,
                      onChanged: (value) {
                        setState(() {
                          valKota = value.toString();
                        });
                      },
                      listData: listKota,
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    FormComponent(
                      isDropdown: true,
                      label: 'Kecamatan',
                      value: valKecamatan,
                      onChanged: (value) {
                        setState(() {
                          valKecamatan = value.toString();
                        });
                      },
                      listData: listKecamatan,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FormComponent(
                      isDropdown: true,
                      label: 'Kelurahan',
                      value: valKelurahan,
                      onChanged: (value) {
                        setState(() {
                          valKelurahan = value.toString();
                        });
                      },
                      listData: listKelurahan,
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    FormComponent(
                      isDropdown: true,
                      label: 'Kode Pos',
                      value: valKodePos,
                      onChanged: (value) {
                        setState(() {
                          valKodePos = value.toString();
                        });
                      },
                      listData: listKodePos,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FormComponent(
                      isDropdown: false,
                      label: 'Nama Jalanan',
                      value: jalan,
                      onChanged: (value) {
                        setState(() {
                          jalan = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormComponent(
                            isDropdown: false,
                            label: 'RT',
                            value: rt,
                            isNumeric: true,
                            onChanged: (value) {
                              setState(() {
                                rt = value.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FormComponent(
                            isDropdown: false,
                            label: 'RW',
                            value: rw,
                            isNumeric: true,
                            onChanged: (value) {
                              setState(() {
                                rw = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FormComponent(
                      isDropdown: false,
                      isNumeric: true,
                      label: 'Nomor Telepon',
                      value: telp,
                      onChanged: (value) {
                        setState(() {
                          telp = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Component().button(
              text: 'Cancel',
              onTap: () => Navigator.pop(context),
              whiteColor: true,
            ),
            Consumer<AlamatProvider>(builder: (context, prov, _) {
              return Component().button(
                text: 'Save',
                onTap: () {
                  if (widget.updateData == null) {
                    prov
                        .tambahAlamat(
                          Alamat(
                            id: prov.listAlamat.isEmpty
                                ? 1
                                : prov.listAlamat.last.id + 1,
                            jalan: jalan,
                            kecamatan: valKecamatan,
                            kelurahan: valKelurahan,
                            kategori: valKategori,
                            kota: valKota,
                            detail: "Baru",
                            negara: valNegara,
                            provinsi: valProvinsi,
                            rt: rt,
                            rw: rw,
                            kodePost: valKodePos,
                            telp: telp,
                            status: (isActive) ? 'Active' : 'Not Active',
                          ),
                        )
                        .then(
                          (value) => Navigator.pop(context),
                        );
                  } else {
                    prov
                        .editAlamat(
                          Alamat(
                            id: widget.updateData?.id ?? 0,
                            jalan: jalan,
                            kecamatan: valKecamatan,
                            kelurahan: valKelurahan,
                            kategori: valKategori,
                            kota: valKota,
                            detail: "Baru",
                            negara: valNegara,
                            provinsi: valProvinsi,
                            rt: rt,
                            rw: rw,
                            kodePost: valKodePos,
                            telp: telp,
                            status: (isActive) ? 'Active' : 'Not Active',
                          ),
                        )
                        .then(
                          (value) => Navigator.pop(context),
                        );
                  }
                },
              );
            }),
          ],
        ),
      ],
    );
  }
}
