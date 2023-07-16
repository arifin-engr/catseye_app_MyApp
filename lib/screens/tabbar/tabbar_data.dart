import 'package:catseye_app/models/SingleProductModel.dart';
import 'package:catseye_app/models/categoryProductModel.dart';
import 'package:catseye_app/routes/routes.dart';
import 'package:catseye_app/widgets/singleProduct_widget.dart';
import 'package:flutter/material.dart';

import '../../data/home-page-data/home-page-data.dart';

class TabBarBar extends StatelessWidget {
  final List<SingleProductModel> productData;

  TabBarBar({required this.productData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: productData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
          productPrice: data.productPrice,
          onPressed: () {},
        );
      },
    );
  }
}
