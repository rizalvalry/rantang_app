import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';


enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  Widget appBarActionButton(BuildContext context) {
    // IconData icon = Icons.ac_unit_outlined;

    // if (type == AppbarActionType.trailing) {
    //   icon = Icons.search;
    // }

    return MaterialApp(
      title: 'AppBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  PreferredSize get _appBar {
     return PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 16.0),
          child: Container(
        // margin: EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 20.0),
            color: Color.fromARGB(255, 214, 79, 200), // Atur warna latar belakang di sini
            child: AppBar(
              title: const Text('AppBar Demo'),
              actions: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                                borderSide: BorderSide.none
                              ),
                             prefixIcon: Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
                            // Aksi ketika ikon keranjang di klik
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

  Widget _headPromo(BuildContext context) {
    return SizedBox(
          height: 180.0,
          child: Stack(
            children: <Widget>[
                Positioned(
                  top: 10.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                       Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      // color: Color.fromARGB(255, 238, 63, 206),
                      child: Center(child: Text('Saldo')),
                    ),
                    Container(
                      height: 70,
                      // color: Colors.green,
                      child: Center(child: Text('Ucapan')),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  // color: Colors.blue,
                  child: Center(child: Text('Poin')),
                ),
              ),
              
                        ],
                      ),
                    ),
                  ),
                ),
              ],
          ),
        );
  }

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
                  ?.copyWith(color: Color.fromARGB(
            255, 214, 79, 200).withOpacity(0.7)),
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
    controller.getAllItems();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                  color: Color.fromARGB(255, 214, 79, 200),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 130.0,
                ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                        top: 10.0,
                        left: 0.0,
                        right: 0.0,
                        child: Text(
                          "Hello Diloka",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      Text(
                        "Lets gets somethings?",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      _headPromo(context),
                      _recommendedProductListView(context),
                      _topCategoriesHeader(context),
                      _topCategoriesListView(),
                      GetBuilder(builder: (ProductController controller) {
                        return ProductGridView(
                          items: controller.filteredProducts,
                          likeButtonPressed: (index) => controller.isFavorite(index),
                          isPriceOff: (product) => controller.isPriceOff(product),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
