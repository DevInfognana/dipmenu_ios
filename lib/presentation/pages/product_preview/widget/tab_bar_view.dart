

/*class TabbarView extends StatefulWidget {
  TabbarView({Key? key, this.controller}) : super(key: key);

  ProductPreviewController? controller;

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  @override
  void initState() {
    super.initState();
  }

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.h,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.controller!.customMenu.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final customMenu = widget.controller!.customMenu[index];
              final size = widget.controller!.minMaxShow(customMenu.id);
            *//*  return Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: ElevatedButton(
                  onPressed: () {
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide.none,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                  ),
                  child: TextWithFont().textWithPoppinsFont(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    text: customMenu.name!,
                  ),
                ),
              );*//*

return Card(
            color: Colors.white,
            elevation: 4,
            child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              iconColor: mainColor,
              maintainState: true,
              title: Text(customMenu.name!,
                  style:
                      TextStore.textTheme.headline4?.copyWith(color: titleColor)),
              subtitle: Text('Min: ${size['min']}  Max: ${size['max']}',
                  style: TextStore.textTheme.headline6
                      ?.copyWith(color: descriptionColor)),
              children: [
                // SizedBox(
                //     height: 20.h,
                //     child: ListViewCard(
                //       customMenuItems: customMenu.customMenuItems,
                //       customProducts: customMenu.customProducts,
                //     ))
              ],
            ),
          );

            },
          ),
        ),
        PageViewCustomize(
          pageController: pageController,
        ),
      ],
    );
  }
}*/

/*class PageViewCustomize extends StatelessWidget {
  PageViewCustomize({Key? key, this.pageController}) : super(key: key);
  PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, int index) {
            Color color;
            if (index % 3 == 0) {
              color = Colors.red;
            } else if (index % 3 == 1) {
              color = Colors.blue;
            } else {
              color = Colors.green;
            }

            return Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.4),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
                    // final subCategoryProduct = controller.subCategoryProductList[index];
                    // final productprice=itemPriceId(subCategoryProduct.defaultSize!,subCategoryProduct.price);
                    return GestureDetector(
                      onTap: (){
                        // Get.toNamed(Routes.productPreviewScreen,arguments: subCategoryProduct);
                      },
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.w)),
                        child: Column(
                          children: [
                            Container(
                              height: 21.5.h,
                              width: 43.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4.w),
                                    topLeft: Radius.circular(4.w)),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4.w),
                                        topLeft: Radius.circular(4.w)),
                                    child: Image.network(
                                      'https://www.freepnglogos.com/uploads/food-png/food-sutherland-foodservice-12.png',
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: mainColor,
                                            value: loadingProgress.expectedTotalBytes !=
                                                null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(ImageAsset.errorImage,
                                            fit: BoxFit.cover);
                                      },
                                    ),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.topRight,
                                  //   child: Padding(
                                  //     padding: EdgeInsets.only(right: 1.h, top: 1.h),
                                  //     child: Card(
                                  //       color: Colors.grey,
                                  //       shape: RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.circular(2.w)),
                                  //       child: SizedBox(
                                  //           height: 4.h,
                                  //           width: 8.w,
                                  //           child: controller.onChange == true? const Icon(Icons.favorite_outline,
                                  //               color: Colors.white):const Icon(Icons.favorite,
                                  //               color: Colors.red)),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            SizedBox(height: 0.2.h),
                            // Flexible(
                            //   child: Padding(
                            //     padding: EdgeInsets.all(0.8.h),
                            //     child: Text(
                            //       controller.subCategoryProductList[index].name!,
                            //       style: TextStore.textTheme.headline6!.copyWith(
                            //           color: Colors.black,
                            //           height: 1.1,
                            //           fontWeight: FontWeight.w900),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 0.2.h),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     const Spacer(flex: 1),
                            //     Text('\$ ${numberFormat.format(double.parse(productprice))}',
                            //         style: TextStore.textTheme.headline6!.copyWith(
                            //             color: Colors.black,
                            //             height: 1.1,
                            //             fontWeight: FontWeight.w900)),
                            //     const Spacer(flex: 3),
                            //     Icon(Icons.shopping_bag_outlined, color: mainColor),
                            //     const Spacer(flex: 1),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (page) {
            // setState(() {
            //   // _selectedIndex = page;
            // });
          },
        ));
  }
}*/

/*class _TabbarViewState extends State<TabbarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.controller!.customMenu.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final customMenu = widget.controller!.customMenu[index];
        final size = widget.controller!.minMaxShow(customMenu.id);
        return Card(
          color: Colors.white,
          elevation: 4,
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.trailing,
            childrenPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            expandedCrossAxisAlignment: CrossAxisAlignment.end,
            iconColor: mainColor,
            maintainState: true,
            title: Text(customMenu.name!,
                style:
                    TextStore.textTheme.headline4?.copyWith(color: titleColor)),
            subtitle: Text('Min: ${size['min']}  Max: ${size['max']}',
                style: TextStore.textTheme.headline6
                    ?.copyWith(color: descriptionColor)),
            children: [
              SizedBox(
                  height: 20.h,
                  child: ListViewCard(
                    customMenuItems: customMenu.customMenuItems,
                    customProducts: customMenu.customProducts,
                  ))
            ],
          ),
        );
      },
    ));
  }
}


class ListViewCard extends StatelessWidget {
  ListViewCard({Key? key, this.customMenuItems,this.customProducts}) : super(key: key);
  final numberFormat = NumberFormat("#,##,##.00");
  List<CustomMenuItems>? customMenuItems;
  List<CustomProducts>? customProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: customMenuItems!.length,
      itemBuilder: (BuildContext context, int index) {
        final subCustomMenuItems = customMenuItems![index];
        return GestureDetector(
          onTap: () {
            print('----->${subCustomMenuItems.name}');
          },
          child: Card(
            color: Colors.grey.shade100,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w)),
            child: Column(
              children: [
                Container(
                  height: 12.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.w),
                        topLeft: Radius.circular(4.w)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.w),
                        topLeft: Radius.circular(4.w)),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: imageview(subCustomMenuItems.image),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: mainColor)),
                        errorWidget: (context, url, error) => Image.asset(
                            ImageAsset.errorImage,
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(height: 0.2.h),
                Flexible(
                    child: Text(subCustomMenuItems.name!,
                        style: TextStore.textTheme.bodyText1!
                            .copyWith(color: Colors.black))),
                subCustomMenuItems.price != '0'
                    ? Text(
                        'Price :  ${numberFormat.format(double.parse(subCustomMenuItems.price!))}',
                        style: TextStore.textTheme.bodyText1!
                            .copyWith(color: Colors.black))
                    : Text('',
                        style: TextStore.textTheme.bodyText1!
                            .copyWith(color: Colors.black)),
              ],
            ),
          ),
        );
      },
    );
  }
}*/

