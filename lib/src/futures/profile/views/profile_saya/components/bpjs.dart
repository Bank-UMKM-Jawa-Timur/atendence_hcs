import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List bpjsKetenagakerjaan = [
  'Kartu Peserta Jamsostek (KPJ)',
  'aminan Kesehatan Nasional (JKN)',
];

Widget bpjsKetenagaKerjaan() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bpjsKetenagakerjaan.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: cGrey_400,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bpjsKetenagakerjaan[index],
                          style: const TextStyle(
                            fontSize: 13,
                            color: cGrey_700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        spaceHeight(7),
                        Text(
                          '-',
                          style: const TextStyle(
                            fontSize: 14,
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
      ),
    ),
  );
}
