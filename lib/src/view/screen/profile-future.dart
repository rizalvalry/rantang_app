import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';

// enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(expandedHeight: 200.0),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              listCardWidget(text1: 'Full Name:', text2: 'George John Carter'),
              listCardWidget(text1: 'Father\'s Name:', text2: 'John Carter'),
              listCardWidget(text1: 'Gender:', text2: 'Male'),
              listCardWidget(text1: 'Marital Status:', text2: 'Single'),
              listCardWidget(text1: 'Email:', text2: 'jane123@123.com'),
              listCardWidget(text1: 'Username:', text2: 'misty123'),
              listCardWidget(text1: 'Phone:', text2: '0987654321'),
              listCardWidget(text1: 'Country', text2: 'India'),
              listCardWidget(text1: 'City', text2: 'Hyderabad'),
              listCardWidget(text1: 'Pincode:', text2: '500014'),
              listCardWidget(text1: 'Company:', text2: 'All Shakes'),
              listCardWidget(text1: 'Website:', text2: 'allshakes.com'),
              listCardWidget(text1: 'Position', text2: 'Manager'),
              listCardWidget(text1: 'LinkedIn Id:', text2: 'misty123'),
              listCardWidget(text1: 'Interest:', text2: 'Swimming,Cycling'),
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

  MySliverAppBar({required this.expandedHeight});

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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff8360c3),
                Color(0xff2ebf91),
              ],
            ),
          ),
          // child: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.black,
          //   ),
          // ),
        ),
        Center(
          child: _appBar
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
        Positioned(
          top: expandedHeight / 4 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Column(
              children: [
                // const Text(
                //   'Check out my Profile',
                //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                // ),
                const SizedBox(
                  height: 30.0,
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SizedBox(
                    height: expandedHeight,
                    width: MediaQuery.of(context).size.width / 2,
                    // child: Text('data')
                  ),
                ),
              ],
            ),
          ),
        ),
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
