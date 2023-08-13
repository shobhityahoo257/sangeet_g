import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/cart.dart';

import '../config.dart';
import '../providers/providers.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return _checkoutBottomNavBar();
  }
}


class _checkoutBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);
    if (cartProvider.cartModel != null) {
      return cartProvider.cartModel!.products.isNotEmpty ?
      Container(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ${Config.currency}${cartProvider.cartModel!.grandTotal
                      .toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
                const Text('Proceed To checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),)

              ],
            ),

          ),
        ),
      )
          : const SizedBox();
    }
    return const SizedBox();
  }
}
