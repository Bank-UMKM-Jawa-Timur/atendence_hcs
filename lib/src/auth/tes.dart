import 'package:atendence_hcs/http/controllers/auth/login_controller.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cPrimary,
      body: Obx(
        () => Stack(
          children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: heightStatusBar),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                      child: SizedBox(
                        width: 100,
                        child: Image(
                          image: AssetImage('assets/icon/hi-welcome.png'),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image(
                        image: AssetImage('assets/images/login.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            spaceHeight(45),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                  child: Column(
                    children: [
                      const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      spaceHeight(30),
                      _inputEmail(),
                      spaceHeight(20),
                      _inputPassword(),
                      spaceHeight(20),
                      _buttomLogin()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttomLogin() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: loginController.isLoading.value
                  ? null
                  : () async {
                      loginController.login();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: cPrimary,
              ),
              label: Text(
                loginController.isLoading.value ? "Loading..." : "Login",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              icon: const Icon(Icons.login_outlined, size: 30),
            ),
          ),
        ),
        spaceWidth(5),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: cPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: cGrey_700,
                    blurRadius: 2,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _inputPassword() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cGrey_300,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: const Color(0xFFE3E2E2),
        ),
      ),
      child: TextField(
        autocorrect: false,
        maxLines: 1,
        obscureText: _obscureText,
        controller: loginController.passwordController,
        enableSuggestions: false,
        decoration: InputDecoration(
          hintText: "Masukkan Password",
          hintStyle: const TextStyle(color: cGrey_700),
          border: InputBorder.none,
          prefixIcon: const Icon(
            CommunityMaterialIcons.lock_open_outline,
            color: cGrey_700,
          ),
          suffixIcon: InkWell(
            child: Icon(
              _obscureText
                  ? CommunityMaterialIcons.eye_off_outline
                  : CommunityMaterialIcons.eye_outline,
              size: 26,
              color: cGrey_700,
            ),
            onTap: () {
              _toggle();
            },
          ),
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cGrey_300,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: const Color(0xFFE3E2E2),
        ),
      ),
      child: TextField(
        autocorrect: false,
        maxLines: 1,
        controller: loginController.emailNipController,
        decoration: const InputDecoration(
          hintText: "Masukkan Email atau Nip",
          hintStyle: TextStyle(color: cGrey_700),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: cGrey_700,
          ),
        ),
      ),
    );
  }
}
