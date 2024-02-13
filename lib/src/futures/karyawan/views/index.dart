import 'dart:async';

import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  Timer? _timer;
  List karyawan = [
    {"name": "Ahmad", "status": false},
    {"name": "Rizki", "status": true},
    {"name": "Zaky", "status": true},
    {"name": "Firman", "status": true},
    {"name": "Saiful", "status": true},
    {"name": "Rian", "status": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Data Karyawan",
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
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: cPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          cursorColor: cPrimary,
                          decoration: const InputDecoration(
                            hintText: "Cari Karyawan",
                            hintStyle:
                                TextStyle(color: cGrey_700, fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(vertical: 13),
                            border: InputBorder.none,
                            // prefixIcon: Padding(
                            //   padding: EdgeInsets.only(right: 20),
                            //   child: Icon(
                            //     Icons.search,
                            //     color: cGrey_900,
                            //     size: 22,
                            //   ),
                            // ),
                          ),
                          onChanged: (value) {
                            if (_timer != null && _timer!.isActive) {
                              _timer!.cancel();
                            }
                            _timer = Timer(const Duration(seconds: 2), () {
                              print(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(itemBuilder: (context, index) {
          //     return
          //   }, itemCount: karyawan.length),
          // )
          Expanded(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  color: cGrey_200,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      "Hasil Pencarian",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: cGrey_200, width: 1.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search,
                              size: 17,
                            ),
                            spaceWidth(10),
                            const Text(
                              "01474 - Arsyad Arthan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
          // emptyData(),
        ],
      ),
    );
  }

  Column emptyData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spaceHeight(60),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Image(
            image: AssetImage('assets/images/empty_data.png'),
          ),
        ),
        Text(
          "Silahkan cari data karyawan untuk\nmenampilkan data karyawan",
          textAlign: TextAlign.center,
          style: customTextStyle(FontWeight.w500, 15, Colors.black),
        )
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
