import 'dart:convert';
import 'package:atendence_hcs/http/models/slip_gaji/list_slip_gaji_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SlipGajiController extends GetxController {
  var typeFilter = false.obs;
  var selectedBulan = "".obs;
  var selectedTahun = "".obs;
  var isLoading = false.obs;
  var totalGaji = 0.obs;
  var totalPotongan = 0.obs;
  var totalGajiBersih = 0.obs;
  SharedPreferences? prefs;
  ListSlipGajiModel? listSlipGaji;

  filter() async {
    prefs = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    // cek selection
    if (selectedBulan.value == "" || selectedTahun.value == "") {
      snackbarfailed("Bulan atau Tahun tidak boleh kosong.");
    } else {
      try {
        isLoading(true);
        http.Response response = await http.get(
          Uri.parse(
            '$base_url/slip-gaji/list?nip=${prefs?.getString("nip")}&tahun=${selectedTahun.value}&bulan=${selectedBulan.value}',
          ),
          headers: headers,
        );
        print(response.body);
        if (response.statusCode == 200) {
          var result = jsonDecode(response.body);
          listSlipGaji = ListSlipGajiModel.fromJson(result);
          typeFilter(true);
          // totalGaji.value = listSlipGaji!.data[0].totalGaji;
          Get.back();
        } else {
          typeFilter(false);
          snackbarfailed("error fetching data ${response.statusCode}");
        }
      } catch (e) {
        snackbarfailed(e.toString());
      } finally {
        isLoading(false);
      }
    }
  }
}
