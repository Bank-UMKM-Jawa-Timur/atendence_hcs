import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/bindings/list_masa_pensiun_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/bindings/histori_pjs_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/bindings/histori_sp_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/jabatan/bindings/histori_jaminan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/jabatan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_data_jamsostek/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_dpp/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/bindings/laporan_mutasi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_demosi.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_mutasi.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_penonaktifan.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_promosi.dart';
import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/bindings/pejabat_sementara_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/pengkinian_data/bindings/list_pengkinian_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pengkinian_data/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/bindings/demosi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/bindings/mutasi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/bindings/penonaktifan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/bindings/promosi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/views/demosi.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/views/mutasi.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/views/penonaktifan.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/views/promosi.dart';
import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/bindings/surat_peringatan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/views/detail_surat_peringatan.dart';
import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/views/surat_peringatan.dart';
import 'package:atendence_hcs/src/futures/home/bindings/home_sdm_binding.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/index.dart';
import 'package:atendence_hcs/src/futures/home/views/home_user/index.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/bindings/list_karyawan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/bindings/search_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/views/search_karyawan_page.dart';
import 'package:atendence_hcs/src/futures/profile/bindings/biodata_binding.dart';
import 'package:atendence_hcs/src/futures/profile/views/index.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/index.dart';

import '../src/auth/bindings/login_binding.dart';
import '../src/auth/views/login.dart';
import '../src/futures/profile/views/profile_saya/index.dart';
import '../src/futures/profile/views/ubah_password/index.dart';
import '../src/futures/profile/bindings/ubah_password_binding.dart';
import '../src/futures/slip_gaji/views/rincian.dart';
import '../src/futures/navigation_bar/index.dart';
import '../routes/route_name.dart';
import '../src/futures/splash_screen/index.dart';
import 'package:get/get.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.navigationBar,
      page: () => const BottomNavigationBarHome(),
    ),
    GetPage(
      name: RouteNames.profileSaya,
      page: () => const ProfileSaya(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: RouteNames.ubahPassword,
      page: () => const UbahPassword(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: RouteNames.slipGaji,
      page: () => SlipGaji(user: "sdm"),
    ),
    GetPage(
      name: RouteNames.rincianSlipGaji,
      page: () => RincianSlipGaji(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.homeSdm,
      page: () => HomeSdm(),
      binding: HomeSdmBinding(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => const ProfilePage(),
      // binding: PrefsBinding(),
    ),
    GetPage(
      name: RouteNames.karyawanList,
      page: () => const KaryawanPage(),
      binding: ListKaryawanBinding(),
    ),
    GetPage(
      name: RouteNames.searchKaryawan,
      page: () => const SearchKaryawanPage(),
      binding: SearchBinding(),
    ),

    // SDM
    GetPage(
      name: RouteNames.dataMasaPensiun,
      page: () => const DataMasaPensiunPage(),
      binding: ListMasaPensiunBinding(),
    ),
    GetPage(
      name: RouteNames.pengkinianData,
      page: () => const PengkinianDataPage(),
      binding: ListPengkinianBinding(),
    ),
    GetPage(
      name: RouteNames.mutasi,
      page: () => const MutasiPage(),
      binding: MutasiBinding(),
    ),
    GetPage(
      name: RouteNames.demosi,
      page: () => const DemosiPage(),
      binding: DemosiBinding(),
    ),
    GetPage(
      name: RouteNames.promosi,
      page: () => const PromosiPage(),
      binding: PromosiBinding(),
    ),
    GetPage(
      name: RouteNames.penonaktifan,
      page: () => const PenonaktifanPage(),
      binding: PenonaktifanBinding(),
    ),
    GetPage(
      name: RouteNames.pejabatSementara,
      page: () => const PejabatSementaraPage(),
      binding: PejabatSementaraBinding(),
    ),
    GetPage(
      name: RouteNames.suratPeringatan,
      page: () => const SuratPeringatan(),
      binding: SuratPeringatanBinding(),
    ),
    GetPage(
      name: RouteNames.detailSuratPeringatan,
      page: () => const DetailSuratPeringatan(),
      binding: SuratPeringatanBinding(),
    ),

    // Histori

    GetPage(
      name: RouteNames.jabatan,
      page: () => const Jabatan(),
      binding: HistoriJaminanBinding(),
    ),
    GetPage(
      name: RouteNames.historiPejabatSementara,
      page: () => const HistoriPejabatSementara(),
      binding: HistoriPjsBinding(),
    ),
    GetPage(
      name: RouteNames.historiSuratPeringatan,
      page: () => const HistoriSuratPeringatan(),
      binding: HistoriSpBinding(),
    ),

    // Laporan

    GetPage(
      name: RouteNames.laporanMutasi,
      page: () => const LaporanMutasi(),
      binding: LaporanMutasiBinding(),
    ),
    GetPage(
      name: RouteNames.laporanDemosi,
      page: () => const LaporanDemosi(),
      // binding: HistoriSpBinding(),
    ),
    GetPage(
      name: RouteNames.laporanPromosi,
      page: () => const LaporanPromosi(),
      // binding: HistoriSpBinding(),
    ),
    GetPage(
      name: RouteNames.laporanPenonaktifan,
      page: () => const LaporanPenonaktifan(),
      // binding: HistoriSpBinding(),
    ),
    GetPage(
      name: RouteNames.laporanDataJamsostek,
      page: () => const LaporanDataJamsostek(),
      // binding: HistoriSpBinding(),
    ),
    GetPage(
      name: RouteNames.laporanDataDpp,
      page: () => const LaporanDpp(),
      // binding: HistoriSpBinding(),
    ),
  ];
}
