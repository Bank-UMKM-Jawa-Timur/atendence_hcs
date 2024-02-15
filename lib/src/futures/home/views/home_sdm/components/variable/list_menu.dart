import 'package:atendence_hcs/routes/route_name.dart';
import 'package:flutter/material.dart';

class ListMenuItems {
  // Manajemen Karyawan
  static List menuManagementList = [
    {
      'icon': Icons.line_style_sharp,
      'name': "Karyawan",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Data Masa Pensiun",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Pengkinian Data",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Pergerakan Karir",
      'route': 'null',
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Pejabat Sementara",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Reward & Punishment",
      'route': 'null',
    },
  ];

  // Penghasilan
  static List menuPenghasilanList = [
    {
      'icon': Icons.line_style_sharp,
      'name': "Proses Penghasilan",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Pajak",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Gaji",
      'route': 'null',
    },
  ];

  // Histori
  static List menuHistoriList = [
    {
      'icon': Icons.line_style_sharp,
      'name': "Jabatan",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Pejabat Sementara",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Surat Peringatan",
      'route': RouteNames.karyawanList,
    },
  ];

  // Laporan
  static List menuLaporanList = [
    {
      'icon': Icons.line_style_sharp,
      'name': "Laporan Pergerakan Karir",
      'route': 'null',
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Data Jamsostek",
      'route': RouteNames.karyawanList,
    },
    {
      'icon': Icons.line_style_sharp,
      'name': "Data DPP",
      'route': RouteNames.karyawanList,
    },
  ];
}
