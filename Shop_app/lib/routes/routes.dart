import 'package:my_shop/views/UiEditor.dart';
import 'package:my_shop/views/bars.dart';
import 'package:my_shop/views/orderDetails.dart';
import 'package:my_shop/views/cartList.dart';
import 'package:my_shop/views/home.dart';
import 'package:my_shop/views/homeWithBottombar.dart';
import 'package:my_shop/views/productDetails.dart';
import 'package:my_shop/views/profile.dart';
import 'package:my_shop/views/splashScreen.dart';

class Routes {
  String splashScreen = Splashscreen().routeName;
  String bars = Bars().routeName;
  // String orderDetails = Orderdetails(image: image, name: name, quantity: quantity, price: price)().routeName;
  String cartList = Cartlist().routeName;
  String home = Home().routeName;
  String homeWithBottombar = Homewithbottombar().routeName;
  // String productDetails = ProductDetails(image: image, name: name, quantity: quantity, price: price, rating: rating)().routeName;
  String profile = Profile().routeName;
}
