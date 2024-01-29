import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSaya extends StatefulWidget {
  const ProfileSaya({super.key});

  @override
  State<ProfileSaya> createState() => _ProfileSayaState();
}

class _ProfileSayaState extends State<ProfileSaya> {
  List<String> _tabs = [
    'Bio Data Diri',
    'No Rek\n& NPWP',
    'Data',
  ];
  List<String> _bodyTabs = [
    'Bio Data Diri',
    'No Rek NPWP',
    'Data',
  ];

  var _isActive = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: themeStatusBar,
          centerTitle: true,
          foregroundColor: Colors.black,
          title: const Text(
            "Profile Saya",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              spaceHeight(25),
              Container(
                height: 50,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: cGrey_300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _isActive = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: (Get.width - 50) / 3,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _isActive == index ? cPrimary : cGrey_300,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _isActive == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              spaceHeight(30),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          width: Get.width,
                          height: 45,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: cGrey_400,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "No Rekening",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: cGrey_700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              spaceHeight(4),
                              Text(
                                _bodyTabs[_isActive],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
