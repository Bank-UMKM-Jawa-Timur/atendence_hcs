import 'package:atendence_hcs/src/futures/SDM/menu/histori.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/laporan.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/manajement.dart';
import 'package:atendence_hcs/src/futures/SDM/menu/penghasilan.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/index.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationBarSdm extends StatefulWidget {
  const NavigationBarSdm({super.key});

  @override
  State<NavigationBarSdm> createState() => _NavigationBarSdmState();
}

class _NavigationBarSdmState extends State<NavigationBarSdm> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeSdm(),
    ManajementMenu(),
    PenghasilanMenu(),
    HistoriMenu(),
    LaporanMenu(),
  ];

  void _onItemTapped(int index) {
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPop,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        // bottomNavigationBar: Container(
        //   decoration: const BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: cGrey_300,
        //         blurRadius: 5,
        //         offset: Offset(0, 0), // Shadow position
        //       ),
        //     ],
        //   ),
        //   child: BottomNavigationBar(
        //     type: BottomNavigationBarType.fixed,
        //     iconSize: 24,
        //     selectedLabelStyle: const TextStyle(fontSize: 12),
        //     backgroundColor: Colors.white,
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(CommunityMaterialIcons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon:
        //             Icon(CommunityMaterialIcons.account_box_multiple, size: 23),
        //         label: 'Manajement',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.wallet_giftcard_sharp),
        //         label: 'Penghasilan',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.history, size: 27),
        //         label: 'Histori',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CommunityMaterialIcons.file_document_outline,
        //             size: 25),
        //         label: 'Laporan',
        //       ),
        //     ],
        //     currentIndex: _selectedIndex,
        //     selectedItemColor: cPrimary,
        //     onTap: _onItemTapped,
        //   ),
        // ),
        bottomNavigationBar: NavigationBar(
          height: 75,
          elevation: 0,
          selectedIndex: _selectedIndex,
          indicatorColor: cPrimary,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              icon: Icon(CommunityMaterialIcons.home),
              label: "Home",
              selectedIcon: Icon(
                CommunityMaterialIcons.home,
                color: cWhite,
              ),
            ),
            NavigationDestination(
              icon: Icon(CommunityMaterialIcons.account_box_multiple),
              label: "Manajemen",
              selectedIcon: Icon(
                CommunityMaterialIcons.account_box_multiple,
                color: cWhite,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.wallet_giftcard_sharp),
              label: "Penghasilan",
              selectedIcon: Icon(
                Icons.wallet_giftcard_sharp,
                color: cWhite,
              ),
            ),
            NavigationDestination(
              icon: Icon(CommunityMaterialIcons.history, size: 27),
              label: "Histori",
              selectedIcon: Icon(
                CommunityMaterialIcons.history,
                size: 27,
                color: cWhite,
              ),
            ),
            NavigationDestination(
              icon: Icon(CommunityMaterialIcons.file_document_outline),
              label: "Laporan",
              selectedIcon: Icon(
                CommunityMaterialIcons.file_document_outline,
                color: cWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
