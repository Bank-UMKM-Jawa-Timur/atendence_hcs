import 'dart:async';

import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/controllers/search_karyawan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchKaryawanPage extends StatefulWidget {
  const SearchKaryawanPage({super.key});

  @override
  State<SearchKaryawanPage> createState() => _SearchKaryawanPageState();
}

class _SearchKaryawanPageState extends State<SearchKaryawanPage> {
  SearchKaryawanController searchC = Get.find<SearchKaryawanController>();
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Search",
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
      body: Obx(
        () => Column(
          children: [
            Container(
              width: Get.width,
              color: cPrimary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
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
                          child: TextField(
                            autocorrect: false,
                            maxLines: 1,
                            cursorHeight: 20,
                            autofocus: true,
                            controller: searchC.searchC,
                            cursorColor: cPrimary,
                            decoration: const InputDecoration(
                              hintText: "Cari Karyawan",
                              hintStyle:
                                  TextStyle(color: cGrey_700, fontSize: 14),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 13),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (_timer != null && _timer!.isActive) {
                                _timer!.cancel();
                              }
                              _timer = Timer(const Duration(seconds: 2), () {
                                // print(value);
                                searchC.getSearch();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 25,
                            height: 26,
                            child: searchC.isLoading.value
                                ? const CircularProgressIndicator(
                                    backgroundColor: cPrimary_300,
                                    color: cPrimary,
                                    strokeWidth: 4,
                                  )
                                : Container(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            !searchC.dataIsEmpty.value
                ? Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          color: cGrey_200,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              "Hasil Pencarian",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                searchC.searchKaryawanModel?.data.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.offNamedUntil(
                                    Get.arguments,
                                    ModalRoute.withName(
                                        RouteNames.navigationBarSdm),
                                    arguments: [
                                      {
                                        'nip': searchC.searchKaryawanModel!
                                            .data[index].nip
                                            .toString(),
                                      },
                                      {
                                        'nama': searchC.searchKaryawanModel!
                                            .data[index].namaKaryawan,
                                      },
                                    ],
                                  );
                                },
                                child: Container(
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          color: cGrey_200, width: 1.5),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.search,
                                          size: 17,
                                        ),
                                        spaceWidth(10),
                                        Text(
                                          "${searchC.searchKaryawanModel!.data[index].nip} - ${searchC.searchKaryawanModel!.data[index].namaKaryawan}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : emptyData(),
            // emptyData(),
          ],
        ),
      ),
    );
  }

  Widget emptyData() {
    return Expanded(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Image(
                    image: AssetImage('assets/images/search_empty.png'),
                  ),
                ),
                Text(
                  "Silahkan cari data karyawan untuk\nmenampilkan data karyawan",
                  textAlign: TextAlign.center,
                  style: customTextStyle(FontWeight.w500, 15, Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
