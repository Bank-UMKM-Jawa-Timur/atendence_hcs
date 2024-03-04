import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPenghasilan extends StatefulWidget {
  const DetailPenghasilan({super.key});

  @override
  State<DetailPenghasilan> createState() => _DetailPenghasilanState();
}

class _DetailPenghasilanState extends State<DetailPenghasilan> {
  @override
  void initState() {
    print(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Detail Penghasilan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              cardItems(),
              // cardDetail(
              //   10000000,
              //   10000000,
              //   10000000,
              //   10000000,
              //   10000000,
              //   10000000,
              //   1000000000,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: cGrey_400),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: cPrimary_300,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                1.toString(),
                                style: customTextStyle(
                                  FontWeight.w800,
                                  16,
                                  cPrimary,
                                ),
                              ),
                            ),
                          ),
                          spaceWidth(10),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama",
                                  style: customTextStyle(
                                    FontWeight.w700,
                                    14,
                                    Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "nip | Januari - 2024",
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    12,
                                    cGrey_700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              spaceHeight(10),
              Container(
                width: Get.width,
                height: 1,
                color: cGrey_400,
              ),
              spaceHeight(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteNames.rincianPenghasilan);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(
                          "Rincian",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: cGreen_900,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteNames.payrollPenghasilan);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cGreen_900,
                        ),
                        child: const Text(
                          "Payroll",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              spaceHeight(5)
            ],
          ),
        ),
      ),
    );
  }
}
