import 'dart:convert';
import '4-util.dart';


Future<double> calculateTotal() async {
  try {
    var user = json.decode(await fetchUserData());
    var orders = json.decode(await fetchUserOrders(user['id'])) ?? [];

    double totalPrice = 0.0;

    if (orders.isEmpty) {
      return -1
    }

    for (var product in orders) {
      var productPrice = json.decode(await fetchProductPrice(product));
      totalPrice += productPrice ?? 0.0;
    }

    return totalPrice;
  } catch (error) {
    print('Error: $error');
    return -1;
  }
}

