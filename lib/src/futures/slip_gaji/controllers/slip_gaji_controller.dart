import 'dart:convert';
import 'package:atendence_hcs/http/models/slip_gaji/list_slip_gaji_model.dart';
import 'package:atendence_hcs/http/models/slip_gaji/rincian_slip_gaji_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SlipGajiController extends GetxController {
  var typeFilter = false.obs;
  var selectedBulan = "".obs;
  var selectedTahun = "".obs;
  var isLoading = false.obs;
  var isLoadingRincian = false.obs;
  var dataIsEmpty = true.obs;
  var dateNow = DateTime.now();
  SharedPreferences? prefs;
  ListSlipGajiModel? listSlipGaji;
  RincianSlipGajiModel? rincianSlipGaji;
  var nip = "".obs;

  var user = "karyawan".obs;

  filter() async {
    selectedTahun.value = dateNow.getYear();
    prefs = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    // cek selection
    if (selectedTahun.value == "") {
      snackbarfailed("Tahun tidak boleh kosong.");
    } else {
      try {
        isLoading(true);
        http.Response response = await http.get(
          Uri.parse(
            user.value == "karyawan"
                ? selectedBulan.value != ""
                    ? '$base_url/slip-gaji/list?nip=${prefs?.getString("nip")}&tahun=${selectedTahun.value}&bulan=${selectedBulan.value}'
                    : '$base_url/slip-gaji/list?nip=${prefs?.getString("nip")}&tahun=${dateNow.getYear()}'
                : selectedBulan.value != ""
                    ? '$base_url/slip-gaji/list?nip=${nip.value}&tahun=${selectedTahun.value}&bulan=${selectedBulan.value}'
                    : '$base_url/slip-gaji/list?nip=${nip.value}&tahun=${dateNow.getYear()}',
          ),
          headers: headers,
        );
        if (response.statusCode == 200) {
          var result = jsonDecode(response.body);
          List data = result['data'];
          if (data.isNotEmpty) {
            dataIsEmpty(false);
            listSlipGaji = ListSlipGajiModel.fromJson(result);
            // typeFilter(true);
          } else {
            dataIsEmpty(true);
          }
          // Get.back();
          // print(json);
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

  getRincian(var id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      isLoadingRincian(true);

      http.Response response = await http.get(
        Uri.parse(
          '$base_url/slip-gaji/detail/$id',
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        rincianSlipGaji = RincianSlipGajiModel.fromJson(result);
      } else {
        snackbarfailed("error fetching data ${response.statusCode}");
      }
    } catch (e) {
      snackbarfailed(e.toString());
    } finally {
      isLoadingRincian(false);
    }
  }
}
