import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/bagian_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/divisi_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/sub_divis_controller.dart';
import 'package:get/get.dart';

class ListMasaPensiunController extends GetxController {
  DivisiController divisC = Get.find<DivisiController>();
  SubDivisiController subDivisiC = Get.find<SubDivisiController>();
  BagianController bagianC = Get.find<BagianController>();

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
  var kategori = ''.obs;
  var showDiv = false.obs;
  var showSubDiv = false.obs;
  var bagian = false.obs;

  void changeValDropdown() {
    if (kategori.value == "") {
      showDiv(false);
      showSubDiv(false);
      bagian(false);
    } else if (kategori.value == "Keseluruhan") {
      showDiv(false);
      showSubDiv(false);
      bagian(false);
    } else if (kategori.value == "Kantor") {
      showDiv(false);
      showSubDiv(false);
      bagian(false);
    } else if (kategori.value == "Sub Divisi") {
      showDiv(true);
      showSubDiv(true);
      bagian(false);
    } else if (kategori.value == "Bagian") {
      showDiv(true);
      showSubDiv(true);
      bagian(true);
    } else if (kategori.value == "Divisi") {
      showDiv(true);
      showSubDiv(false);
      bagian(false);
    }
  }
}
