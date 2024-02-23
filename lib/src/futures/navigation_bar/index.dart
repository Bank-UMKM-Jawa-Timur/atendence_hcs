import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/index.dart';
import 'package:atendence_hcs/src/futures/incoming/index.dart';
import 'package:atendence_hcs/src/futures/profile/views/index.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/index.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BottomNavigationBarHome extends StatefulWidget {
  const BottomNavigationBarHome({super.key});

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  PrefsController prefsC = Get.put(PrefsController());
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    commingSoon("Tampilan Home Masih\nDalam Proses Pengembangan!"),
    // HomeSdm(),
    commingSoon("Tampilan Jadwal Masih\nDalam Proses Pengembangan!"),
    commingSoon("Tampilan Permohonan Masih\nDalam Proses Pengembangan!"),
    SlipGaji(user: "karyawan"),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    prefsC.addPrefs();
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime timeBackPresed = DateTime.now();

  Future<bool> onPop() async {
    final diference = DateTime.now().difference(timeBackPresed);
    final isExitWaring = diference >= const Duration(seconds: 2);

    timeBackPresed = DateTime.now();

    if (isExitWaring) {
      Fluttertoast.showToast(
        msg: "Tekan Lagi untuk Keluar",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0x8A272727),
        textColor: Colors.black,
      );
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onPop,
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: cGrey_300,
                  blurRadius: 5,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 24,
              selectedLabelStyle: const TextStyle(fontSize: 12),
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.alarm),
                  label: 'Jadwal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Permohonan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.file_document_outline),
                  label: 'Slip Gaji',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.account_outline, size: 25),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: cPrimary,
              onTap: _onItemTapped,
            ),
          ),
        ),
      );
}
