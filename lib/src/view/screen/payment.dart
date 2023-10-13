import 'dart:convert';

import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/api/api.dart';
import 'package:e_commerce_flutter/src/view/screen/checkout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class Payment extends StatefulWidget {
  final int totalPrice;
  final String invoiceNumber;

  const Payment(
      {Key? key, required this.totalPrice, required this.invoiceNumber})
      : super(key: key);

  @override
  State<Payment> createState() => PaymentState();
}

Future<String> getSnapToken(int totalPrice, String invoiceNumber) async {
  var url = Uri.parse('https://app.sandbox.midtrans.com/snap/v1/transactions');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Basic U0ItTWlkLXNlcnZlci1qLVVzNTVrenpLUkJyR1Y5NWFSZWJaOUg6UEBzc3cwcmQ=',
    'Accept': 'application/json',
  };

  // var body = '{"transaction_details":{"order_id":"INV-2023","gross_amount":250000},"credit_card":{"secure":true}}';

  var body = jsonEncode({
    "transaction_details": {
      "order_id": invoiceNumber,
      "gross_amount": totalPrice, // Use the totalPrice parameter
    },
    "credit_card": {"secure": true}
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 201) {
    final responseJson = jsonDecode(response.body);
    final token = responseJson['token'];
    final redirectUrl = responseJson['redirect_url'];
    final snapTokenData = {
      'token': token,
      'redirectUrl': redirectUrl,
    };
    return jsonEncode(snapTokenData); // Mengembalikan JSON
  } else {
    print(response.statusCode);
    throw Exception('Failed to get Snap Token');
  }
}

class PaymentState extends State<Payment> {
  late String invoiceNumber;
  final _controller = WebViewController();
  late String redirectUrl; // Declare redirectUrl here

  @override
  void initState() {
    super.initState();
    invoiceNumber =
        CreateInvoice.generateInvoiceNumber(); // Generate the invoice number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: getSnapToken(widget.totalPrice, invoiceNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final snapTokenData = jsonDecode(snapshot.data!);
              final token = snapTokenData['token'];
              final redirectUrl = snapTokenData['redirectUrl'];

              print(redirectUrl);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Token: $token',
                  //   style: TextStyle(fontSize: 18),
                  // ),
                  // Text(
                  //   'Redirect URL: $redirectUrl',
                  //   style: TextStyle(fontSize: 18),
                  // ),
                  Center(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total Belanja : ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  widget.totalPrice.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Invoice : ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  invoiceNumber,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (redirectUrl != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Checkout(
                              redirectUrl: redirectUrl, // Pass the redirectUrl
                            ),
                          ),
                        );
                      } else {
                        // Handle case where redirectUrl is null or empty
                      }
                    },
                    child: Text('Pilih Pembayaran'),
                  ),
                ],
              );
            } else {
              return Center(child: Text('Failed to get Snap Token'));
            }
          } else {
            return Center(
                child: CircularProgressIndicator(
                    backgroundColor: AppColor.baseColor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
          }
        },
      ),
    );
  }
}
