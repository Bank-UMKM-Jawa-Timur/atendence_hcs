import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  SharedPreferences? prefs;
  var nip = 'null'.obs;
  var namaKaryawan = 'null'.obs;
  var jenisKelamin = 'null'.obs;
  var entitasType = 'null'.obs;
  var displayJabatan = 'null'.obs;
  var tanggalBergabung = 'null'.obs;
  var lamaKerja = 'null'.obs;
  var noRekening = 'null'.obs;

  addPrefs() async {
    prefs = await SharedPreferences.getInstance();
    nip.value = "${prefs?.getString("nip")}";
    namaKaryawan.value = "${prefs?.getString("nama_karyawan")}";
    jenisKelamin.value = "${prefs?.getString("jenis_kelamin")}";
    entitasType.value = "${prefs?.getInt("entitas_type")}";
    displayJabatan.value = "${prefs?.getString("display_jabatan")}";
    tanggalBergabung.value = "${prefs?.getString("tanggal_bergabung")}";
    lamaKerja.value = "${prefs?.getString("lama_kerja")}";
    noRekening.value = "${prefs?.getString("no_rekening")}";
  }
}
