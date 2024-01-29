import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SlipGaji extends StatelessWidget {
  const SlipGaji({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        centerTitle: false,
        foregroundColor: Colors.black,
        title: const Text(
          "Slip Gaji",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.white,
            onTap: () {},
            child: const SizedBox(
              width: 27,
              height: 27,
              child: Image(
                image: AssetImage('assets/icon/icon_filter.png'),
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
