import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKaryawan extends StatefulWidget {
  const DetailKaryawan({super.key});

  @override
  State<DetailKaryawan> createState() => _DetailKaryawanState();
}

class _DetailKaryawanState extends State<DetailKaryawan> {
  @override
  void initState() {
    super.initState();
    print(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Detail Karyawan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: cPrimary,
            elevation: 0,
            foregroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: const Text(
    //       "Detail Karyawan",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 17,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //     backgroundColor: cPrimary,
    //     elevation: 0,
    //     foregroundColor: Colors.white,
    //     bottom: const TabBar(
    //       tabs: [
    //         Tab(icon: Icon(Icons.directions_car)),
    //         Tab(icon: Icon(Icons.directions_transit)),
    //         Tab(icon: Icon(Icons.directions_bike)),
    //       ],
    //     ),
    //   ),
    //   body: const TabBarView(
    //     children: [
    //       Icon(Icons.directions_car),
    //       Icon(Icons.directions_transit),
    //       Icon(Icons.directions_bike),
    //     ],
    //   ),
    // );
  }
}
