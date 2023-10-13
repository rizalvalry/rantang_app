import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/controller/auth_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/auth/page_login.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/widget/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex = 0;
   bool isLoggedIn = false; // Tambahkan variabel status sesi
  
  @override
  void initState() {

    void printStoredToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Stored Token: $token');
  }
    
    super.initState();
    // Panggil metode dari AuthController
    AuthController.isLoggedIn().then((loggedIn) {
      setState(() {
        isLoggedIn = loggedIn;
      });
    });
  }
  

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      ProductListScreen(),
      FavoriteScreen(),
      CartScreen(),
      isLoggedIn ? ProfileScreen() : PageLogin()
    ];

    return PageWrapper(
      child: Scaffold(
        backgroundColor: Color.fromARGB(
            255, 214, 79, 200),
        bottomNavigationBar: CurvedNavigationBar( 
          height: 65.0,
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            buttonBackgroundColor: AppColor.baseColor,
            animationCurve: Curves.easeInCirc,
            color: AppColor.baseColor.withOpacity(1),
            animationDuration: Duration(microseconds: 100),
            onTap: (currentIndex) {
               setState(() {
              this.currentIndex = currentIndex;
            });
          },
          items: AppData.iconWidgetList,
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[currentIndex], // Menggunakan screens[currentIndex]
        ),
      ),
    );
  }
}
