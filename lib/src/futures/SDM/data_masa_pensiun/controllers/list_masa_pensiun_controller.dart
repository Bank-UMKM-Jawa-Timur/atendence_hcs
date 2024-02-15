import 'package:get/get.dart';

class ListMasaPensiunController extends GetxController {
  List row1 = [
    {'title': "Jabatan:", 'value': 'Kepala Seksi'},
    {'title': "Kantor:", 'value': 'Pusat'},
    {'title': "Gol:", 'value': '-'},
  ];
  List row2 = [
    {'title': "Tgl Lahir:", 'value': '19 Feb 1999'},
    {'title': "Umur:", 'value': '25'},
    {'title': "JK:", 'value': 'Perempuan'},
  ];
  List row3 = [
    {'title': "Status:", 'value': 'K/O'},
    {'title': "Sk Angkat:", 'value': '016A/KEP/DIR.Um/2002'},
    {'title': "Tgl Angkat:", 'value': '02 Jan 2002'},
  ];
  List row4 = [
    {'title': "Masa Kerja:", 'value': '0,1'},
    {'title': "Pendidikan Terakhir:", 'value': 'S2'},
  ];
  List row5 = [
    {'title': "Status:", 'value': 'Sudah melebihi batas pansiun'},
  ];

  var isLoading = false.obs;
}
