import 'package:catseye_app/data/home-page-data/home-page-data.dart';
import 'package:catseye_app/widgets/home_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../appColors/app_colors.dart';
import '../../routes/routes.dart';
import '../../services/services_homepage_products.dart';
import '../../stylies/home_screen_stylies.dart';
import '../../svgimages/svg_images.dart';
import '../../widgets/show_all_widget.dart';
import '../../widgets/singleProduct_widget.dart';
import '../detailscreen/detail_screen.dart';
import '../slider/slider_controller.dart';
import '../tabbar/tabbar_data.dart';

class HomePage extends StatelessWidget {
  AppBar buildAppBar() {
    return AppBar(
      title: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: "Search Catseye",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
              style: TextStyle(fontSize: 12, height: 0.2))
        ],
      ),
      bottom: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 15),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Clothing"),
          Text("Shoes"),
          Text("Accesories"),
        ],
      ),
    );
  }

//Advertisment Method
  Widget buildAdvertismentPlace() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Container(height: 170, child: HomeBannerWidget()),
    );
  }

//showAllHomePageProduct

  Widget showAllHomePageProduct() {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: FutureBuilder(
            future: getHomePageProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return
                    // StaggeredGrid.count(
                    //     crossAxisCount: 4,
                    //     mainAxisSpacing: 4,
                    //     crossAxisSpacing: 4,
                    //     children: [
                    //       for (var i = 0; i < snapshot.data.length; i++)
                    //         SingleProductWidget(
                    //           productImage: snapshot.data[i].image,
                    //           productModel: snapshot.data[i].color,
                    //           productName: snapshot.data[i].color,
                    //           productOldPrice: snapshot.data[i].price,
                    //           productPrice: snapshot.data[i].price,
                    //           //onPressed: () {},
                    //         )
                    //     ]);

                    GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  itemCount: snapshot.data.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    var data = snapshot.data[index];
                    return SingleProductWidget(
                      productImage: data.image,
                      productModel: data.color,
                      productName: data.color,
                      productOldPrice: data.price,
                      productPrice: data.price,
                      onPressed: () {},
                    );
                  },
                );
              }
            }));
  }

//Test

  Widget TestMyProduct() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: FutureBuilder(
          future: getHomePageProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    if (snapshot.data[index].image == "") {
                      return Container(
                        child: Row(
                          children: [
                            Text("images/productImages/" +
                                snapshot.data[index].image),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${snapshot.data![index].color}",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      var path = "images/productImages/";
                      var fileName = snapshot.data[index].image;
                      var imagePath = path + fileName;
                      print(imagePath);
                      return Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 100,
                              child: Image.asset(
                                  "images/productImages/${snapshot.data[index].image}"),
                              // Text("images/productImages/" +
                              //     snapshot.data[index].image)
                              // decoration: BoxDecoration(
                              //   color: Colors.transparent,
                              //   image: DecorationImage(
                              //     fit: BoxFit.cover,
                              //     image: AssetImage(
                              //       "images/productImages/" +
                              //           snapshot.data![index].image,
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                        //     child: Text(
                        //   "${snapshot.data![index].color}",
                        //   style: TextStyle(
                        //     fontSize: 18.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // )
                      );
                    }
                  });
            }
          }),
    );
  }

//Tending Product Method
  Widget buildTrendingProduct(
      {required String productImage,
      required String productName,
      required String productModel,
      required double productPrice}) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, bottom: 10, right: 20),
      height: 90,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: HomeScreenStylies.trendingProductNameStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    productModel,
                    style: HomeScreenStylies.trendingProductModelStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStylies.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                //Advertisment
                buildAdvertismentPlace(),

                //All Product
                ShowAllWidget(
                  leftText: "New Arrival",
                ),
                showAllHomePageProduct()
              ],
            ),
            TabBarBar(
              productData: colothsData,
            ),
            TabBarBar(
              productData: shoesData,
            ),
            TabBarBar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }
}
