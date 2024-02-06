import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/src/futures/incoming/index.dart';
import 'package:atendence_hcs/src/futures/profile/views/index.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/index.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
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
    commingSoon("Tampilan Jadwal Masih\nDalam Proses Pengembangan!"),
    commingSoon("Tampilan Permohonan Masih\nDalam Proses Pengembangan!"),
    SlipGaji(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    prefsC.addPrefs();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
