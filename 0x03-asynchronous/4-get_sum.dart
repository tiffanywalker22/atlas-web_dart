import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    var userResponse = await fetchUserData();
    var user = json.decode(userResponse);

    if (user == null || !user.containsKey('id')) {
      throw Exception('Invalid user data');
    }

    var ordersResponse = await fetchUserOrders(user['id']);
    var orders = json.decode(ordersResponse) ?? [];

    double totalPrice = 0.0;

    if (orders.isEmpty) {
      return 0.0;
    }

    for (var product in orders) {
      var productPriceResponse = await fetchProductPrice(product);
      var productPrice = json.decode(productPriceResponse);

      if (productPrice == null) {
        throw Exception('Invalid product price for $product');
      }

      totalPrice += productPrice;
    }

    return totalPrice;
  } catch (error) {
    print('Error: $error');
    return -1;
  }
}

