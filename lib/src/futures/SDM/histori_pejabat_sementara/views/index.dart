import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_button.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriPejabatSementara extends StatefulWidget {
  const HistoriPejabatSementara({super.key});

  @override
  State<HistoriPejabatSementara> createState() =>
      _HistoriPejabatSementaraState();
}

class _HistoriPejabatSementaraState extends State<HistoriPejabatSementara> {
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      dropdownValue = "Karyawan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        title: const Text(
          "Histori Pejabat Sementara",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    selectKategori(),
                    nip == ""
                        ? dropdownValue == "Karyawan"
                            ? searchKaryawan()
                            : Container()
                        : searchKaryawan(),
                    // dropdownValue == "Aktif" ? Container() : searchKaryawan(),
                    spaceHeight(7),
                    buttonWithIcon(
                      const Icon(
                        CommunityMaterialIcons.filter_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      "Tampilkan",
                      "namRoute",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell searchKaryawan() {
    return InkWell(
      onTap: () {
        Get.toNamed(
          RouteNames.searchKaryawan,
          arguments: RouteNames.historiPejabatSementara,
        );
      },
      child: Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: cGrey_700, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.search,
                  color: cGrey_900,
                  size: 22,
                ),
              ),
              spaceWidth(8),
              Expanded(
                flex: 10,
                child: Text(
                  nip == "" ? nama : "$nip - $nama",
                  style: const TextStyle(
                    color: cGrey_900,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectKategori() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Kategori'),
        ),
        isDense: true,
        isExpanded: true,
        value: dropdownValue,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Aktif', 'Karyawan']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
