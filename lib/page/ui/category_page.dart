import 'package:briflynews/controller/controller.dart';

import '../../resource/style.dart';
import '../../route/app_page.dart';
import '../../shared/common/status_progress_bar.dart';
import '../../resource/colors.dart';
import '../../controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget{
  @override
  createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    CategoryController.to.onInitCall(selectLanguage: ProfileController.to.selectLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => CategoryController.to.statusProgressBar ==
                StatusProgressBar.LOADING
            ? Center(
                child: CircularProgressIndicator(
                    color: accentColor, strokeWidth: 0.9))
            : SafeArea(
                child: GridView.builder(
                    itemCount: CategoryController.to.categoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        childAspectRatio: 5 / 4),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.CATEGORY_DETAIL_ROUTE,
                                arguments: [CategoryController.to
                                    .categoryList[index].categoryName,
                                CategoryController.to
                                    .categoryEnglish[index].categoryName,
                                ]);
                          },
                          child: Card(
                              elevation: 0.5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(20))),
                                      width: double.maxFinite,
                                      height: 300,
                                      child: Column(children: [
                                        Image.network(
                                            CategoryController.to
                                                .categoryList[index].imageUrl,
                                            color: accentColor,
                                            height: 60),
                                        SizedBox(height: 10),
                                        Align(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15.0),
                                                child: Text(
                                                    CategoryController.to
                                                        .categoryList[index]
                                                        .categoryName,
                                                    style: categoryNameStyle)),
                                            alignment: Alignment.bottomCenter)
                                      ])))));
                    }))));
  }
}
