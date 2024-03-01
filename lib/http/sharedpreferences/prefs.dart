import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  SharedPreferences? prefs;
  var biometric = false.obs;
  var nip = 'null'.obs;
  var namaKaryawan = 'null'.obs;
  var jenisKelamin = 'null'.obs;
  var entitasType = 'null'.obs;
  var displayJabatan = 'null'.obs;
  var tanggalBergabung = 'null'.obs;
  var lamaKerja = 'null'.obs;
  var noRekening = 'null'.obs;
  var pswd = 'null'.obs;
  var tipe = 'null'.obs;
  var email = 'null'.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    addPrefs();
    super.onInit();
  }

  addPrefs() async {
    isLoading(true);
    prefs = await SharedPreferences.getInstance();
    try {
      biometric.value = prefs?.getBool("biometric") == null ? false : true;
      // print(biometric.value);
      nip.value = "${prefs?.getString("nip")}";
      namaKaryawan.value = "${prefs?.getString("nama_karyawan")}";
      jenisKelamin.value = "${prefs?.getString("jenis_kelamin")}";
      entitasType.value = "${prefs?.getInt("entitas_type")}";
      displayJabatan.value = "${prefs?.getString("display_jabatan")}";
      tanggalBergabung.value = "${prefs?.getString("tanggal_bergabung")}";
      lamaKerja.value = "${prefs?.getString("lama_kerja")}";
      noRekening.value = "${prefs?.getString("no_rekening")}";
      pswd.value = "${prefs?.getString("pswd")}";
      tipe.value = "${prefs?.getString("tipe")}";
      email.value = "${prefs?.getString("email")}";
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
