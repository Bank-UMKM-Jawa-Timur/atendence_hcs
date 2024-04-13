import 'package:atendence_hcs/src/futures/profile/controllers/biodata_controller.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/biodata_karyawan.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/bpjs.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/data_gaji.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/data_karyawan.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/data_potongan.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/histori.dart';
import 'package:atendence_hcs/src/futures/profile/views/profile_saya/components/norek_npwp.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSaya extends StatefulWidget {
  const ProfileSaya({super.key});

  @override
  State<ProfileSaya> createState() => _ProfileSayaState();
}

class _ProfileSayaState extends State<ProfileSaya> {
  BiodataController biodataC = Get.find<BiodataController>();
  List<String> _tabs = [
    'Biodata\nKaryawan',
    'Data Karyawan',
    'No Rek\n& NPWP',
    'BPJS &\n Ketenaga Kerjaan',
    'Data Gaji\n&Tunjangan',
    'Data Potongan',
    'Histori',
  ];
  List<String> _bodyTabs = [
    'Biodata Karyawan',
    'Data Karyawan',
    'No Rek\n& NPWP',
    'BPJS &\n Ketenaga Kerjaan',
    'Data Gaji\n&Tunjangan',
    'Data Potongan',
    'Histori',
  ];
  @override
  void initState() {
    biodataC.getBiodata(Get.arguments['nip']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: cPrimary_200,
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: Text(
            Get.arguments['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: cPrimary,
          elevation: 1,
        ),
        body: Column(
          children: [
            spaceHeight(10),
            SizedBox(
              height: 55,
              child: Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  itemCount: _tabs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            biodataC.isActive.value = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 100,
                          decoration: BoxDecoration(
                            color: biodataC.isActive.value == index
                                ? cPrimary
                                : cWhite,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                _tabs[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: biodataC.isActive.value == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (biodataC.isActive.value == 0)
              biodataC.isLoading.value
                  ? const CircularProgressIndicator()
                  : biodataKaryawan(biodataC.dataBiodataKaryawan)
            else if (biodataC.isActive.value == 1)
              dataKaryawan(biodataC.dataKaryawanValue)
            else if (biodataC.isActive.value == 2)
              norekAndNpwp()
            else if (biodataC.isActive.value == 3)
              bpjsKetenagaKerjaan()
            else if (biodataC.isActive.value == 4)
              dataGaji()
            else if (biodataC.isActive.value == 5)
              dataPotongan()
            else if (biodataC.isActive.value == 6)
              history()
          ],
        ),
      ),
    );
  }
}
