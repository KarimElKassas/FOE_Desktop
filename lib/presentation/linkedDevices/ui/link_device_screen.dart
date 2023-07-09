import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_future_chat_desktop/resources/extentions.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/components.dart';

class LinkDeviceScreen extends StatelessWidget {
  LinkDeviceScreen({Key? key}) : super(key: key);
  MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MobileScanner(
          // fit: BoxFit.contain,
          controller: controller,
          onDetect: (capture) async {
            print("DETECTED : \n");
            var connection = HubConnectionBuilder()
                .withUrl("http://172.16.1.42:9101/communityhub")
                .build();

            await connection.start();
            connection.on("QRCodeScanned", (arguments) {
                print("ARGUMENTS : $arguments\n");
            });

            var qrCodeData = "El Qassas"; // Replace with the actual QR code data
            await connection.invoke("ScanQRCode", args: [qrCodeData]);

          },
        ),
      ),
    );
  }
}
