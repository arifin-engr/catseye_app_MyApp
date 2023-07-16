import 'package:catseye_app/data/category-data/category.data.dart';
import 'package:catseye_app/data/home-page-data/home-page-data.dart';
import 'package:catseye_app/models/categoryProductModel.dart';
import 'package:catseye_app/routes/routes.dart';
import 'package:catseye_app/screens/category/sub_category.dart';
import 'package:catseye_app/widgets/category_product_widget.dart';
import 'package:flutter/material.dart';

class CategoryMenTabBar extends StatelessWidget {
  List<CategoryProductModel> categoryProductModel = [];
  CategoryMenTabBar({
    required this.categoryProductModel,
  });

  @override
  Widget build(BuildContext context) {
    var data;
    buildConditions(index) {
      if (index == 0) {
        PageRouting.goToNextPage(
          //fillClothData[index]
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: colothsData,
            productName: data.productName,
          ),
          context: context,
        );
      } else if (index == 1) {
        PageRouting.goToNextPage(
          //fillClothData[index]
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: colothsData,
            productName: data.productName,
          ),
          context: context,
        );
      } else if (index == 2) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 3) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 4) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryProductModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        data = categoryProductModel[index];
        return CategoryProductWidget(
          onPressed: () {
            buildConditions(index);
          },
          productImage: data.productImage,
          productModel: "${colothsData.length}\t${data.productModel}",
          productName: data.productName,
        );
      },
    );
  }
}
