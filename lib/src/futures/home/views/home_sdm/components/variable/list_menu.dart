import 'package:atendence_hcs/routes/route_name.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class ListMenuItems {
  // Manajemen Karyawan
  static List menuManagementList = [
    {
      'icon': CommunityMaterialIcons.account_cog_outline,
      'name': "Karyawan",
      'route': RouteNames.karyawanList,
      'arguments': ''
    },
    {
      'icon': CommunityMaterialIcons.file_chart_outline,
      'name': "Data Masa Pensiun",
      'route': RouteNames.dataMasaPensiun,
      'arguments': '',
    },
    {
      'icon': CommunityMaterialIcons.file_document_edit_outline,
      'name': "Pengkinian Data",
      'route': RouteNames.pengkinianData,
      'arguments': '',
    },
    {
      'icon': CommunityMaterialIcons.menu_open,
      'name': "Pergerakan Karir",
      'route': 'null',
      'arguments': '',
    },
    {
      'icon': CommunityMaterialIcons.file_account_outline,
      'name': "Pejabat Sementara",
      'route': RouteNames.pejabatSementara,
      'arguments': '',
    },
    {
      'icon': CommunityMaterialIcons.menu_open,
      'name': "Reward & Punishment",
      'route': 'null',
      'arguments': '',
    },
  ];

  // Penghasilan
  static List menuPenghasilanList = [
    {
      'icon': CommunityMaterialIcons.file_certificate_outline,
      'name': "Proses Penghasilan",
      'route': RouteNames.penghasilan,
    },
    {
      'icon': Icons.account_balance_wallet_rounded,
      'name': "Gaji",
      'route': 'null',
    },
  ];

  // Histori
  static List menuHistoriList = [
    {
      'icon': CommunityMaterialIcons.file_document_edit_outline,
      'name': "Jabatan",
      'route': RouteNames.jabatan,
    },
    {
      'icon': CommunityMaterialIcons.file_account_outline,
      'name': "Pejabat Sementara",
      'route': RouteNames.historiPejabatSementara,
    },
    {
      'icon': CommunityMaterialIcons.file_remove_outline,
      'name': "Surat Peringatan",
      'route': RouteNames.historiSuratPeringatan,
    },
  ];

  // Laporan
  static List menuLaporanList = [
    {
      'icon': CommunityMaterialIcons.file_eye_outline,
      'name': "Laporan Pergerakan Karir",
      'route': 'null',
    },
    {
      'icon': CommunityMaterialIcons.file_document_edit_outline,
      'name': "Laporan Data Jamsostek",
      'route': RouteNames.laporanDataJamsostek,
    },
    {
      'icon': CommunityMaterialIcons.file_certificate_outline,
      'name': "Laporan Data DPP",
      'route': RouteNames.laporanDataDpp,
    },
    {
      'icon': CommunityMaterialIcons.file_chart_outline,
      'name': "Laporan Rekap Tetap",
      'route': RouteNames.laporanRekapTetap,
    },
  ];
}
