import 'package:atendence_hcs/src/futures/home/controllers/detail_payment_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shadow.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPayments extends StatelessWidget {
  const DetailPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DetailPaymentController>(
      init: DetailPaymentController(),
      initState: (c) {
        c.controller!.getGaji();
      },
      builder: (c) {
        return Scaffold(
          backgroundColor: cGrey_200,
          appBar: appBarPrimary("Detail Perkiraan Gaji"),
          bottomNavigationBar: Container(
            width: Get.width,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                shadowMedium,
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total :",
                    style: customTextStyle(
                      FontWeight.w600,
                      16,
                      cGrey_900,
                    ),
                  ),
                  Text(
                    FormatCurrency.convertToIdr(c.total.value, 0),
                    style: customTextStyle(
                      FontWeight.w800,
                      17,
                      cPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: c.isLoading.value
              ? Center(child: loadingPage())
              : RefreshIndicator(
                  onRefresh: () => c.getGaji(),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: ListView.builder(
                        itemCount: c.rincianGajiM!.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = c.rincianGajiM!.data;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1, color: cGrey_400),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: cPrimary,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${index + 1}",
                                              style: customTextStyle(
                                                  FontWeight.w600,
                                                  16,
                                                  Colors.white),
                                            ),
                                          ),
                                        ),
                                        spaceWidth(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data[index].kantor.toString(),
                                              style: customTextStyle(
                                                  FontWeight.w600,
                                                  16,
                                                  Colors.black),
                                            ),
                                            Text(
                                              data[index].kdCabang ?? '000',
                                              style: customTextStyle(
                                                FontWeight.w500,
                                                14,
                                                cGrey_900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          CommunityMaterialIcons
                                              .currency_usd_circle_outline,
                                          size: 23,
                                          color: cGrey_700,
                                        ),
                                        Text(
                                          FormatCurrency.convertToIdr(
                                                  data[index].totalGaji, 0)
                                              .toString(),
                                          style: customTextStyle(
                                              FontWeight.w700, 15, cPrimary),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
        );
      },
    );
  }
}
