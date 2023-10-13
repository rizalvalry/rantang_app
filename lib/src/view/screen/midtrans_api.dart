import 'package:http/http.dart' as http;

void main() async {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic U0ItTWlkLXNlcnZlci1qLVVzNTVrenpLUkJyR1Y5NWFSZWJaOUg6UEBzc3cwcmQ=',
    'Accept': 'application/json',
  };

  final data = '{"transaction_details":{"order_id":"INV-00","gross_amount":150000},"credit_card":{"secure":true}}';

  final url = Uri.parse('https://app.sandbox.midtrans.com/snap/v1/transactions');

  final res = await http.post(url, headers: headers, body: data);
  final status = res.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  print(res.body);
}