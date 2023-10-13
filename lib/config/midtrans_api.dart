// import 'dart:convert';

// import 'package:http/http.dart' as http;

// Future<String> getSnapToken() async {
//    var url = Uri.parse('https://app.sandbox.midtrans.com/snap/v1/transactions');
//    var headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Basic U0ItTWlkLXNlcnZlci1qLVVzNTVrenpLUkJyR1Y5NWFSZWJaOUg6UEBzc3cwcmQ=',
//     'Accept': 'application/json',
//   };

//   var body = '{"transaction_details":{"order_id":"INV-2023","gross_amount":250000},"credit_card":{"secure":true}}';

//   final response = await http.post(url,
//     headers: headers,
    
//     body: body
 
//   );

//    if (response.statusCode == 201) {
//     final responseJson = jsonDecode(response.body);
//     final token = responseJson['token'];
//     final redirectUrl = responseJson['redirect_url'];
//     final snapTokenData = {
//       'token': token,
//       'redirectUrl': redirectUrl,
//     };
//     return jsonEncode(snapTokenData); // Mengembalikan JSON
//   } else {
//     print(response.statusCode);
//     throw Exception('Failed to get Snap Token');
//   }
// }
