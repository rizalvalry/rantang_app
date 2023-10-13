import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PointPage(),
  ));
}

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                backgroundHeader(context),
                summaryCash(context),
              ],
            ),
            tabBarOutput(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Konten untuk tab Tukar Poin
                  Center(
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemCount: 3, // Ganti dengan jumlah widget yang Anda inginkan
        itemBuilder: (_, index) {
          return _cardPoint(context);
        },
      ),
    ),
  ),
),

                  // Konten untuk tab History Poin
                  Center(
                    child: Text('Konten History Poin'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardPoint(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.pointProducts.length,
          itemBuilder: (_, index) {
            final product = AppData.pointProducts[index];
            print(AppData.pointProducts.length);
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    product.imagePath != null
                        ? Image.asset(
                            product.imagePath!,
                            fit: BoxFit.cover,
                            width: 250,
                          )
                        : SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 100),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(Icons
                                      .info, color: AppColor.baseColor,), // Icon yang ingin ditampilkan
                                ],
                              ),
                              SizedBox(width: 8), // Jarak antara icon dan text
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // Mulai dari kiri
                                children: [
                                  Text(
                                    product.keterangan ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '30 Aug 2023',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget tabBarOutput() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          child: Text(
            'Tukar Poin',
          ),
        ),
        Tab(
          child: Text(
            'History Poin',
          ),
        ),
      ],
      indicatorColor: AppColor.baseColor,
      labelColor: AppColor.baseColor, //<-- selected text color
      unselectedLabelColor: Colors.black54, //<-- Unselected text color
    );
  }
}

Widget summaryCash(BuildContext context) {
  return Positioned(
    top: 70,
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
                Row(
                  children: [
                    Text('Pendapatan Poin',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    Spacer(),
                    Text(
                      '21.588',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Poin',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    Spacer(),
                    Text(
                      '7.150',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Tambah Poin'),
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

Row _buildBalanceRow() {
  return Row(
    children: [
      Text('Poin', style: TextStyle(fontWeight: FontWeight.bold)),
      Spacer(),
      Text(
        '14.290',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget backgroundHeader(BuildContext context) {
  return Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.baseColor, // Change the colors for testing
          AppColor.baseColor,
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
      title: Text("Detail Point"),
      centerTitle:
          true, // Menggunakan properti centerTitle untuk membuat teks pusat
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
