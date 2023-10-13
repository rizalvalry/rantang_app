import 'package:intl/intl.dart';

class CreateInvoice {
  static int _invoiceCounter = 0;

  static String generateInvoiceNumber() {
    // Get current date
    DateTime now = DateTime.now();
    String year = DateFormat('yyyy').format(now);
    String month = DateFormat('MM').format(now);
    String day = DateFormat('dd').format(now);

    // Generate invoice number
    _invoiceCounter++;
    String invoiceNumber = 'INV-$year/$month/$day-$_invoiceCounter';

    return invoiceNumber;
  }
}

void main() {
  for (int i = 0; i < 5; i++) {
    String invoiceNumber = CreateInvoice.generateInvoiceNumber();
    print(invoiceNumber);
  }
}
