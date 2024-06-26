import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/bindings/list_masa_pensiun_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/bindings/histori_pjs_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/bindings/histori_sp_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/jabatan/bindings/histori_jaminan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/jabatan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_data_jamsostek/bindings/laporan_jamsostek_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_data_jamsostek/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_dpp/bindings/laporan_dpp_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_dpp/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/bindings/laporan_demosi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/bindings/laporan_mutasi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/bindings/laporan_penonaktifan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/bindings/laporan_promosi_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_demosi.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_mutasi.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_penonaktifan.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/views/laporan_promosi.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/bindings/detail_rekap_tetap_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/bindings/laporan_rekap_tetap_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/detail.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/histori.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/laporan.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/manajement.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/penghasilan.dart';
import 'package:atendence_hcs/src/futures/SDM/navigation_bar_sdm/index.dart';
import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/bindings/pejabat_sementara_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/bindings/detail_penghasilan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/bindings/payroll_penghasilan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/bindings/penghasilan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/bindings/rincian_penghasilan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/detail.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/payroll.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/rincian.dart';
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
import 'package:atendence_hcs/src/futures/home/bindings/detail_payment_binding.dart';
import 'package:atendence_hcs/src/futures/home/bindings/home_sdm_binding.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/widgets/menu_penghasilan.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/detail_payments.dart';
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
      name: RouteNames.navigationBarSdm,
      page: () => const NavigationBarSdm(),
      binding: HomeSdmBinding(),
    ),
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
    GetPage(
      name: RouteNames.detailPayements,
      page: () => const DetailPayments(),
      binding: DetailPaymentBinding(),
    ),

    // Penghasilan
    GetPage(
      name: RouteNames.penghasilan,
      page: () => const ProsesPenghasilan(),
      binding: PenghasilanBinding(),
    ),
    GetPage(
      name: RouteNames.detailPenghasilan,
      page: () => const DetailPenghasilan(),
      binding: DetailPenghasilanBinding(),
    ),
    GetPage(
      name: RouteNames.rincianPenghasilan,
      page: () => const RincianPenghasilan(),
      binding: RincianPenghasilanBinding(),
    ),
    GetPage(
      name: RouteNames.payrollPenghasilan,
      page: () => const PayrollPenghasilan(),
      binding: PayrollPenghasilanBinding(),
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
      binding: LaporanDemosiBinding(),
    ),
    GetPage(
      name: RouteNames.laporanPromosi,
      page: () => const LaporanPromosi(),
      binding: LaporanPromosiBinding(),
    ),
    GetPage(
      name: RouteNames.laporanPenonaktifan,
      page: () => const LaporanPenonaktifan(),
      binding: LaporanPenonaktifanBinding(),
    ),
    GetPage(
      name: RouteNames.laporanDataJamsostek,
      page: () => const LaporanDataJamsostek(),
      binding: LaporanJamsostekBinding(),
    ),
    GetPage(
      name: RouteNames.laporanDataDpp,
      page: () => const LaporanDpp(),
      binding: LaporanDppBinding(),
    ),
    GetPage(
      name: RouteNames.laporanRekapTetap,
      page: () => const LaporanRekapTetap(),
      binding: LaporanRekapTetapBinding(),
    ),
    GetPage(
      name: RouteNames.detailLaporanRekapTetap,
      page: () => const DetailLaporanRekapTetap(),
      binding: DetailRekapTetapBinding(),
    ),

    // Menu
    GetPage(
      name: RouteNames.menuManajement,
      page: () => const ManajementMenu(),
      // binding: DetailRekapTetapBinding(),
    ),
    GetPage(
      name: RouteNames.menuPenghasilan,
      page: () => const PenghasilanMenu(),
      // binding: DetailRekapTetapBinding(),
    ),
    GetPage(
      name: RouteNames.menuHistory,
      page: () => const HistoriMenu(),
      // binding: DetailRekapTetapBinding(),
    ),
    GetPage(
      name: RouteNames.menuLaporan,
      page: () => const LaporanMenu(),
      // binding: DetailRekapTetapBinding(),
    ),
  ];
}
