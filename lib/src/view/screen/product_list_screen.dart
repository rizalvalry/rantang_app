import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/top_up_page.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: AppData.recommendedProducts[index].cardBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '30% OFF DURING \nCOVID 19',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppData
                                  .recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                color: AppData.recommendedProducts[index]
                                    .buttonTextColor!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/shopping.png',
                      height: 125,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top categories",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColor.baseColor),
            child: Text(
              "SEE ALL",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColor.baseColor.withOpacity(0.5)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: MySliverAppBar(expandedHeight: 125.0, context: context),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _recommendedProductListView(context),
                    _topCategoriesHeader(context),
                    _topCategoriesListView(),
                    GetBuilder(builder: (ProductController controller) {
                      return ProductGridView(
                        items: controller.filteredProducts,
                        likeButtonPressed: (index) =>
                            controller.isFavorite(index),
                        isPriceOff: (product) => controller.isPriceOff(product),
                      );
                    }),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }

  Widget listCardWidget({required String text1, required text2}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  text1,
                  style: const TextStyle(fontSize: 18),
                )),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                text2,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
   final BuildContext context;

  MySliverAppBar({required this.expandedHeight, required this.context});

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 16.0),
      child: Container(
        // margin: EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 20.0),
        color: AppColor.baseColor, // Atur warna latar belakang di sini
        child: AppBar(
          // title: const Text('AppBar Demo'),
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Aksi ketika ikon notifikasi di klik
                      },
                      icon: Icon(Icons.notifications),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                      },
                      icon: Icon(Icons.shopping_cart),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headPromo(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Positioned(
      top: expandedHeight / 2 - shrinkOffset,
      left: 20.0,
      right: 20.0,
      child: Opacity(
        opacity: (1 - shrinkOffset / expandedHeight),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Container(
            child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.baseColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: AppColor.baseColor.withOpacity(0.5), width: 1.0),
                  color: Color.fromARGB(255, 250, 249, 249),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/saldo.png',
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                          width:
                                              10), // Jarak antara gambar dan teks
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height:
                                                  10), // Tambahkan padding atas di sini
                                          Text(
                                            'Saldo', // Ganti dengan teks yang diinginkan
                                            style: TextStyle(
                                            ),
                                          ),
                                          Text(
                                            'Rp. 317.500',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Divider(
                                  color: AppColor.baseColor,
                                  thickness: 2.0,
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15, right: 25),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/Icon2.png',
                                          height: 15,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                            width:
                                                10), // Jarak antara gambar dan teks
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Ucapan', // Ganti dengan teks yang diinginkan
                                              style: TextStyle(
                                              ),
                                            ), // Tambahkan padding atas di sini
                                           
                                            Text(
                                              '37',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColor.baseColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                   onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TopUpPage()), // Ganti dengan halaman yang ingin ditampilkan
                              );
                            },
                                    child: Text(
                                      "Top Up",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Divider(
                                  color: AppColor.baseColor,
                                  thickness: 2.0,
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/Icon3.png',
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                            width:
                                                10), // Jarak antara gambar dan teks
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Point', // Ganti dengan teks yang diinginkan
                                              style: TextStyle(
                                              ),
                                            ),
                                            Text(
                                              '4.750',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: expandedHeight / 2 - shrinkOffset,
                      left: MediaQuery.of(context).size.width / 2.25,
                      child: Container(
                        width: 2.0,
                        height: 50,
                        color: AppColor.baseColor,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        // Container(
        //   alignment: Alignment.centerLeft,
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(25),
        //       bottomLeft: Radius.circular(25),
        //     ),
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         Color.fromARGB(255, 224, 219, 233),
        //         Color(0xff2ebf91),
        //       ],
        //     ),
        //   ),
        // ),
        Center(child: _appBar
            // Opacity(
            //   opacity: shrinkOffset / expandedHeight,
            //   child: const Text(
            //     'My Profile',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.w700,
            //       fontSize: 23,
            //     ),
            //   ),
            // ),
            ),
        _headPromo(context, shrinkOffset, overlapsContent)
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomSliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_CustomSliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
