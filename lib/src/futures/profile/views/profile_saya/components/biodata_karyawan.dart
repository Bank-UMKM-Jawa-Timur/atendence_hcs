import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List listBiodata = [
  'NIK',
  'Nama Karyawan',
  'Tempat Tanggal Lahir',
  'Umur',
  'Agama',
  'Jenis Kelamin',
  'Status Pernikahan',
  'Kewarganegaraan',
  'Alamat KTP',
  'Alamat Sekarang',
];

Widget biodataKaryawan(List data) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: cGrey_400,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                    Text(
                      "Gambar tidak ada!",
                      style: TextStyle(
                        fontSize: 7,
                        color: cGrey_900,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              spaceHeight(10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listBiodata.length,
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
                              listBiodata[index],
                              style: const TextStyle(
                                fontSize: 13,
                                color: cGrey_700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            spaceHeight(7),
                            Text(
                              data[index] ?? '-',
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
              )
            ],
          ),
        ),
      ),
    ),
  );
}
