import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  SharedPreferences? prefs;
  var nip = 'null'.obs;
  var namaKaryawan = 'null'.obs;
  var jenisKelamin = 'null'.obs;
  var entitasType = 'null'.obs;
  var displayJabatan = 'null'.obs;

  addPrefs() async {
    prefs = await SharedPreferences.getInstance();
    nip.value = "${prefs?.getString("nip")}";
    namaKaryawan.value = "${prefs?.getString("nama_karyawan")}";
    jenisKelamin.value = "${prefs?.getString("jenis_kelamin")}";
    entitasType.value = "${prefs?.getInt("entitas_type")}";
    displayJabatan.value = "${prefs?.getString("display_jabatan")}";
    print(nip.value);
  }
}
