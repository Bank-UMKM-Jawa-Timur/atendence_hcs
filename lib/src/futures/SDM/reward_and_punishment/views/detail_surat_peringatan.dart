import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/controllers/surat_peringatan_controller.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailSuratPeringatan extends StatefulWidget {
  const DetailSuratPeringatan({super.key});

  @override
  State<DetailSuratPeringatan> createState() => _DetailSuratPeringatanState();
}

class _DetailSuratPeringatanState extends State<DetailSuratPeringatan> {
  SuratPeringatanController spC = Get.find<SuratPeringatanController>();

  @override
  void initState() {
    super.initState();
    spC.getDetailSp(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Data SP', 'Dokumen SK'];
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        backgroundColor: cGrey_200,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: cPrimary,
                  foregroundColor: Colors.white,
                  title: const Text('Detail Surat Peringatan'),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  pinned: true,
                  expandedHeight: 120,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: TabBar(
                              dividerColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: const BoxDecoration(
                                color: cPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              tabs: tabs
                                  .map((String name) => Tab(text: name))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Obx(
                () => spC.isLoadingDetail.value
                    ? loadingPage()
                    : Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 50 + 130,
                          bottom: 25,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: spC.listDetailSp.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 15,
                                  ),
                                  child: Container(
                                    width: Get.width,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: cGrey_400,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          spC.listDetailSp[index]['title'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: cGrey_700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        spaceHeight(5),
                                        Text(
                                          spC.listDetailSp[index]['value'],
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 50 + 130,
                  bottom: 25,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: Get.width,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Comming  Soon...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
