import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import '../../homepage/home.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//

class body_form extends StatefulWidget {
  const body_form({Key? key}) : super(key: key);

  @override
  State<body_form> createState() => _body_formState();
}

class _body_formState extends State<body_form> {
  bool isHiddenPassword = true;
  String kHashId = 'wmnejfhs34pd844T4T7IDc';

  var msgController = TextEditingController();
  var passControleler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: size > 380
              ? EdgeInsets.only(right: 25, left: 25, top: 0)
              : EdgeInsets.only(right: 25, left: 25, top: 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: msgController,
                  decoration: InputDecoration(
                    contentPadding: size > 380
                        ? EdgeInsets.only(top: 22, bottom: 22, left: 10)
                        : EdgeInsets.only(top: 18, bottom: 18, left: 10),
                    hintText: "E-mail nebo přihlašovací jméno",
                    hintStyle: GoogleFonts.roboto(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                    suffixIcon: IconButton(
                      iconSize: 25,
                      onPressed: () {
                        msgController.clear();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passControleler,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: size > 380
                        ? EdgeInsets.only(top: 22, bottom: 22, left: 10)
                        : EdgeInsets.only(top: 18, bottom: 18, left: 10),
                    hintText: "Heslo",
                    hintStyle: GoogleFonts.roboto(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                    suffixIcon: IconButton(
                      iconSize: 25,
                      onPressed: () {
                        _togglePasswordView();
                      },
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size > 380 ? 55 : 45,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 181, 202, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Přihlásit se',
                          style: GoogleFonts.roboto(fontSize: 15),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          // <-- Icon
                          Icons.arrow_forward,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size > 380 ? 55 : 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 1, color: Color.fromRGBO(0, 181, 202, 1)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // <-- Icon
                          Icons.qr_code_scanner_rounded,
                          size: 25.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Přihlásit pomocí QR kódu',
                          style: GoogleFonts.roboto(color: Colors.black, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    if (passControleler.text.isNotEmpty && msgController.text.isNotEmpty) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final info = await deviceInfo.deviceInfo;

      if (kIsWeb) {
        print("web");
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo info = await deviceInfo.androidInfo;
        print(info.toMap());
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await deviceInfo.iosInfo;
        print(info.toMap());
      } else if (Platform.isLinux) {
        LinuxDeviceInfo info = await deviceInfo.linuxInfo;
        print(info.toMap());
      } else if (Platform.isMacOS) {
        MacOsDeviceInfo info = await deviceInfo.macOsInfo;
        print(info.toMap());
      } else if (Platform.isWindows) {
        WindowsDeviceInfo info = await deviceInfo.windowsInfo;
        print(info.toMap());
      }

      Response response = await http.put(
        Uri.parse(
          "https://app.recruitis.io/api2/login",
        ),
        body: jsonEncode(<String, dynamic>{
          "username": msgController.text,
          "password": passControleler.text,
          "device_id": "",
          "device_name": "Iphone 11",
          "idhash": "wmnejfhs34pd844T4T7IDc"
        }),
      );
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Špatné údaje"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Prázdné pole"),
        ),
      );
    }
  }
}
