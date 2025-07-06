import 'package:flutter/material.dart';
import 'package:freshly_app/core/network/paymob_constants.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

void payMobPayment() {
  PaymentData.initialize(
    apiKey:
        apiKey, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
    iframeId: iframeId, // Required: Found under Developers -> iframes
    integrationCardId:
        integrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
    integrationMobileWalletId: integrationMobileWallet,

    // Optional Style Customizations
    style: Style(
      primaryColor: Colors.blue, // Default: Colors.blue
      scaffoldColor: Colors.white, // Default: Colors.white
      appBarBackgroundColor: Colors.blue, // Default: Colors.blue
      appBarForegroundColor: Colors.white, // Default: Colors.white
      textStyle: const TextStyle(), // Default: TextStyle()
      buttonStyle:
          ElevatedButton.styleFrom(), // Default: ElevatedButton.styleFrom()
      circleProgressColor: Colors.blue, // Default: Colors.blue
      unselectedColor: Colors.grey, // Default: Colors.grey
    ),
  );
}
