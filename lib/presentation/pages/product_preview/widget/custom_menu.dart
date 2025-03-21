// import 'package:dip_menu/presentation/pages/product_preview/widget/menu.dart';
// import 'package:flutter/material.dart';
//
//
// class CustomMenu extends SliverPersistentHeaderDelegate{
//
//   final ValueChanged<int> onChanged;
//   final int selectedIndex;
//
//   CustomMenu({required this.onChanged, required this.selectedIndex});
//
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       height: 52,
//       child: Categories(
//           onChanged: onChanged,
//           selectedIndex: selectedIndex
//       ),
//     );
//   }
//
//   @override
//   //  maxExtent
//   double get maxExtent => 52;
//
//   @override
//   // implement minExtent
//   double get minExtent => 52;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
//
// }
//
// class Categories extends StatefulWidget {
//   const Categories({
//     Key? key,
//     required this.onChanged,
//     required this.selectedIndex,
//   }) : super(key: key);
//
//   final ValueChanged<int> onChanged;
//   final int selectedIndex;
//
//   @override
//   State<Categories> createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//   int selectedIndex = 0;
//   late ScrollController _controller;
//   @override
//   void initState() {
//     _controller = ScrollController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(covariant Categories oldWidget) {
//     _controller.animateTo(
//       // menu - horizontal scroll end space with time duration
//       80.0 * widget.selectedIndex,
//       curve: Curves.ease,
//       duration: const Duration(milliseconds: 200),
//     );
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<CategoryMenu> demoCategoryMenus = [
//       CategoryMenu(
//         category: "Most Popular",
//         items: [
//           Menu(
//             price: 7.4,
//             image: "assets/images/f_0.png",
//             title: "Cookie Sandwich",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_1.png",
//             title: "Chow Fun",
//           ),
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_2.png",
//             title: "Dim SUm",
//           ),
//           Menu(
//             price: 12.4,
//             image: "assets/images/f_3.png",
//             title: "Cookie Sandwich",
//           ),
//         ],
//       ),
//       CategoryMenu(
//         category: "Beef & Lamb",
//         items: [
//           Menu(
//             price: 7.4,
//             image: "assets/images/f_4.png",
//             title: "Combo Burger",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_5.png",
//             title: "Combo Sandwich",
//           ),
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_2.png",
//             title: "Dim SUm",
//           ),
//           Menu(
//             price: 12.4,
//             image: "assets/images/f_3.png",
//             title: "Oyster Dish",
//           ),
//         ],
//       ),
//       CategoryMenu(
//         category: "Seafood",
//         items: [
//           Menu(
//             price: 7.4,
//             image: "assets/images/f_6.png",
//             title: "Oyster Dish",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_7.png",
//             title: "Oyster On Ice",
//           ),
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_8.png",
//             title: "Fried Rice on Pot",
//           ),
//         ],
//       ),
//       CategoryMenu(
//         category: "Appetizers",
//         items: [
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_2.png",
//             title: "Dim SUm",
//           ),
//           Menu(
//             price: 7.4,
//             image: "assets/images/f_0.png",
//             title: "Cookie Sandwich",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_5.png",
//             title: "Combo Sandwich",
//           ),
//           Menu(
//             price: 12.4,
//             image: "assets/images/f_3.png",
//             title: "Cookie Sandwich",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_1.png",
//             title: "Chow Fun",
//           ),
//         ],
//       ),
//       CategoryMenu(
//         category: "Dim Sum",
//         items: [
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_5.png",
//             title: "Combo Sandwich",
//           ),
//           Menu(
//             price: 12.4,
//             image: "assets/images/f_3.png",
//             title: "Cookie Sandwich",
//           ),
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_2.png",
//             title: "Dim SUm",
//           ),
//           Menu(
//             price: 7.4,
//             image: "assets/images/f_6.png",
//             title: "Oyster Dish",
//           ),
//           Menu(
//             price: 9.0,
//             image: "assets/images/f_7.png",
//             title: "Oyster On Ice",
//           ),
//           Menu(
//             price: 8.5,
//             image: "assets/images/f_8.png",
//             title: "Fried Rice on Pot",
//           ),
//         ],
//       ),
//     ];
//
//     return SingleChildScrollView(
//       controller: _controller,
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           demoCategoryMenus.length,
//               (index) => Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: TextButton(
//               onPressed: () {
//                 widget.onChanged(index);
//                 // _controller.animateTo(
//                 //   80.0 * index,
//                 //   curve: Curves.ease,
//                 //   duration: const Duration(milliseconds: 200),
//                 // );
//               },
//               style: TextButton.styleFrom(
//                   primary: widget.selectedIndex == index
//                       ? Colors.black
//                       : Colors.black45),
//               child: Text(//'menu',
//                 demoCategoryMenus[index].category,
//                 style: const TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }
//
// class CategoryMenu {
//   final String category;
//   final List<Menu> items;
//
//   CategoryMenu({required this.category, required this.items});
// }
// class Menu {
//   final String title, image;
//   final double price;
//
//   Menu({required this.title, required this.image, required this.price});
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_textstyle.dart';
import '../../../../core/config/theme.dart';

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

Widget floatingbtn(
    {bool? endPointValues, required  Function() onViewbuttonpressed, int? totalLength,required String name}) {
  return getDeviceType() == 'phone'
      ? (totalLength! > 6
          ? FloatingActionButton.extended(
              onPressed: () {

                endPointValues == true ?  onViewbuttonpressed():null;
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w)),
              label: Text(name,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: Colors.white)),
              backgroundColor: endPointValues == true ? mainColor : Colors.grey)
          : FloatingActionButton.extended(
              onPressed: () {
                onViewbuttonpressed();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w)),
              label: Text(name,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: Colors.white)),
              backgroundColor: mainColor))
      : (totalLength! > 15
          ? FloatingActionButton.extended(
              onPressed: () {
                endPointValues == true ? onViewbuttonpressed():null;
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w)),
              label: Text(name,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: Colors.white)),
              backgroundColor: endPointValues == true ? mainColor : Colors.grey)
          : FloatingActionButton.extended(
              onPressed: () {
                onViewbuttonpressed();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w)),
              label: Text(name,
                  style: TextStore.textTheme.headline3!
                      .copyWith(color: Colors.white)),
              backgroundColor: mainColor));
}
