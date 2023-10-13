import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TopUpPage(),
  ));
}

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  backgroundHeader(context),
                  summaryCash(context),
                ],
              ),
              filterSaldo(context),
              cardDetail(
                  'Makan Siang', 'Beli Makan Di Warteg', '10.000', 'out'),
              cardDetail('Bonus', 'Dapat Bonus Proyek', '500.000', 'in'),
              cardDetail('Beli Baju', 'Baju Kemeja Kantor', '250.000', 'out'),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterSaldo(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "History Saldo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectDate(context, isStartDate: true);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 10),
                          Text("TanggalAwal"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectDate(context, isStartDate: false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 10),
                          Text("TanggalAkhir"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget cardDetail(title, description, price, type) {
  return Card(
    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
    elevation: 8,
    child: ListTile(
      leading: Icon(
        type == 'out'
            ? Icons.account_balance_wallet_sharp
            : Icons.library_books_rounded,
        color: type == 'out' ? AppColor.baseColor : Colors.lightGreen,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
      trailing: Text(
        "Rp " + price,
        style: TextStyle(
            color: type == 'out' ? Colors.redAccent : Colors.lightGreen),
      ),
    ),
  );
}

Widget summaryCash(BuildContext context) {
  return Positioned(
    top: 60,
    left: 0,
    right: 0,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: _buildBalanceRow(),
          ),
          Divider(
            color: AppColor.baseColor,
            height: 1,
            thickness: 0.5,
            indent: 15, // Margin kiri
            endIndent: 15, // Margin kanan
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Up Saldo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nominal TopUp',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: _buildDropDown(),
          ),
          SizedBox(height: 20),
          Divider(
            color: AppColor.baseColor,
            height:15,
            thickness: 0.5,
            indent: 15, // Margin kiri
            endIndent: 15, // Margin kanan
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('TopUp Sekarang'),
              style: ElevatedButton.styleFrom(
                primary: AppColor.baseColor,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}

DropdownButtonFormField<int> _buildDropDown() {
  return DropdownButtonFormField<int>(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Pilih Nominal TopUp',
    ),
    items: [50000, 100000, 150000, 200000, 250000, 500000, 1000000]
        .map<DropdownMenuItem<int>>(
          (value) => DropdownMenuItem<int>(
            value: value,
            child: Text('Rp. $value'),
          ),
        )
        .toList(),
    onChanged: (value) {
      // Handle the selected value
    },
  );
}

Row _buildBalanceRow() {
  return Row(
    children: [
      Text('Saldo', style: TextStyle(fontWeight: FontWeight.bold)),
      Spacer(),
      Text(
        'Rp. 317.500',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget backgroundHeader(BuildContext context) {
  return Container(
    height: 400,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.baseColor, // Change the colors for testing
          Colors.white,
        ],
        stops: [0.0, 1.0],
      ),
    ),
    child: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        alignment: AlignmentDirectional.centerEnd,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text("Detail Saldo"),
      centerTitle:
          true, // Menggunakan properti centerTitle untuk membuat teks pusat
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

Future<void> _selectDate(BuildContext context,
    {bool isStartDate = true}) async {
  DateTime selectedDate = DateTime.now();

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != selectedDate) {
    // Anda bisa meng-handle tanggal yang dipilih di sini
    print("Selected date: $picked");
  }
}
