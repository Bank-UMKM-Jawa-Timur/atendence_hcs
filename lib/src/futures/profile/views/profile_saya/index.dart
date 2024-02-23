import 'package:atendence_hcs/src/futures/profile/controllers/biodata_controller.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
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
    'Bio Data Diri',
    'No Rek\n& NPWP',
    'Data',
  ];
  List<String> _bodyTabs = [
    'Bio Data Diri',
    'No Rek NPWP',
    'Data',
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
        backgroundColor: Colors.white,
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
        body: Obx(
          () => biodataC.isLoading.value
              ? loadingPage()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      spaceHeight(25),
                      Container(
                        height: 50,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: cGrey_300,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: _tabs.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  biodataC.isActive.value = index;
                                });

                                if (biodataC.isActive.value == 0) {
                                  biodataC.itemCountData.value =
                                      biodataC.titleBioDataDiri.length;
                                  biodataC.dataListTitle =
                                      biodataC.titleBioDataDiri;
                                  biodataC.dataListValue =
                                      biodataC.dataTitleBioDataDiri;
                                } else if (biodataC.isActive.value == 1) {
                                  biodataC.itemCountData.value =
                                      biodataC.titleNorekAndNpwp.length;
                                  biodataC.dataListTitle =
                                      biodataC.titleNorekAndNpwp;
                                  biodataC.dataListValue =
                                      biodataC.dataTitleNorekAndNpwp;
                                } else {
                                  biodataC.itemCountData.value =
                                      biodataC.titleDataJabatan.length;
                                  biodataC.dataListTitle =
                                      biodataC.titleDataJabatan;
                                  biodataC.dataListValue =
                                      biodataC.dataTitleDataJabatan;
                                }
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: (Get.width - 50) / 3,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: biodataC.isActive.value == index
                                      ? cPrimary
                                      : cGrey_300,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
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
                            );
                          },
                        ),
                      ),
                      spaceHeight(30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: biodataC.itemCountData.value,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  width: Get.width,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: cGrey_400,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        biodataC.dataListTitle[index],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: cGrey_700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      spaceHeight(5),
                                      Text(
                                        biodataC.dataListValue?[index] ?? '-',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
