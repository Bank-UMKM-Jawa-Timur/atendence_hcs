import 'package:get/get.dart';

class FormatBulan extends GetxController {
  var namaBulan = "".obs;

  formatBulan(int bln) {
    switch (bln) {
      case 1:
        namaBulan.value = "Januari";
        break;
      case 2:
        namaBulan.value = "Februari";
        break;
      case 3:
        namaBulan.value = "Maret";
        break;
      case 4:
        namaBulan.value = "April";
        break;
      case 5:
        namaBulan.value = "Mei";
        break;
      case 6:
        namaBulan.value = "Juni";
        break;
      case 7:
        namaBulan.value = "Juli";
        break;
      case 8:
        namaBulan.value = "Agustus";
        break;
      case 9:
        namaBulan.value = "September";
        break;
      case 10:
        namaBulan.value = "Oktober";
        break;
      case 11:
        namaBulan.value = "November";
        break;
      case 12:
        namaBulan.value = "Desember";
        break;
    }
    return namaBulan.value;
  }
}
