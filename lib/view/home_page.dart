import 'package:cin_test/model/alamat.dart';
import 'package:cin_test/view/widget/add_component/add_web_component.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cin_test/repository/shared_pref.dart';
import 'package:cin_test/view/widget/add_component/add_phone_component.dart';
import 'package:cin_test/view/widget/alert_component.dart';
import 'package:cin_test/view/widget/component.dart';
import 'package:cin_test/view/widget/form_component.dart';
import 'package:cin_test/view/widget/search_widget.dart';
import 'package:cin_test/viewmodel/alamat_provider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AlamatProvider>(context, listen: false).getAlamat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<AlamatProvider>(builder: (context, prov, _) {
                    return SearchComponent(
                      hint: 'Search ...',
                      text: prov.query,
                      onSearch: (text) {
                        prov.query = text;
                        prov.searchAlamat(text);
                      },
                    );
                  }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Component().button(
                  text: 'Tambah Data',
                  icon: Icons.add,
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return kIsWeb ? AddWebComponent() : AddPhoneComponent();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Consumer<AlamatProvider>(builder: (context, alamatProv, _) {
            return Expanded(
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 24,
                showBottomBorder: true,
                headingRowColor:
                    MaterialStateProperty.all<Color>(Colors.grey[200] as Color),
                minWidth: 1000,
                columns: const [
                  DataColumn2(
                    label: Text('Nama Jalan'),
                    fixedWidth: 130,
                  ),
                  DataColumn2(label: Text('Kecamatan')),
                  DataColumn(
                    label: Text('Kelurahan'),
                  ),
                  DataColumn(
                    label: Text('Kota'),
                  ),
                  DataColumn(
                    label: Text('Provinsi'),
                  ),
                  DataColumn(
                    label: Text('Negara'),
                  ),
                  DataColumn(
                    label: Text('Kategori'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  ),
                  DataColumn(
                    label: Text('Detail'),
                  ),
                  DataColumn(
                    label: Text('Aksi'),
                  ),
                ],
                rows: (alamatProv.query == ""
                        ? alamatProv.listAlamat
                        : alamatProv.filteredAlamat)
                    .map(
                      (e) => DataRow(
                        cells: [
                          DataCell(Text(e.jalan ?? "-")),
                          DataCell(Text(e.kecamatan ?? "-")),
                          DataCell(Text(e.kelurahan ?? "-")),
                          DataCell(Text(e.kota ?? "-")),
                          DataCell(Text(e.provinsi ?? "-")),
                          DataCell(Text(e.negara ?? "-")),
                          DataCell(Text(e.kategori ?? "-")),
                          DataCell(Text(e.status ?? "-")),
                          DataCell(Text(e.detail ?? "-")),
                          DataCell(
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return kIsWeb
                                            ? AddWebComponent(
                                                updateData: e,
                                              )
                                            : AddPhoneComponent(
                                                updateData: e,
                                              );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.green[300],
                                    ),
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AlertComponent().deleteAlert(context,
                                        onDelete: () {
                                      alamatProv.deleteAlamat(e.id).then(
                                          (value) => Navigator.pop(context));
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.red,
                                    ),
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          }),
        ],
      )),
    );
  }
}
