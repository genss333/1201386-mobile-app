import 'package:flutter/material.dart';

import 'comoponents/banner.dart';
import 'comoponents/product.dart';
import 'comoponents/promotion.dart';

class Menu01 extends StatelessWidget {
  const Menu01({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BannerAds(),
        const SizedBox(height: 16),
        const SizedBox(
          height: 100,
          child: Promotion(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: const Product(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
