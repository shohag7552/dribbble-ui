import 'package:dribbble_ui_design/app/animation/transform.dart';
import 'package:dribbble_ui_design/app/combines/colors.dart';
import 'package:dribbble_ui_design/app/views/bank/bank_page.dart';
import 'package:dribbble_ui_design/app/views/menu/menu_page_controller.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  MenuController menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pabBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarPortion(),
              ShakeTransition(
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: menuController.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(menuController.data[index]),
                                // image: NetworkImage(
                                //   menuController.data[index],
                                // ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: size.width * 0.6,
                            // child: Image.network(
                            //   menuController.data[index],
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ShakeTransition(
                child: Wrap(
                  spacing: 10,
                  children: [
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        color: cartlightColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/tree.svg',
                        color: Colors.white60,
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        color: cartlightColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/android.svg',
                        color: Colors.white60,
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.15,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: cartlightColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/travelbag.svg',
                        color: Colors.white60,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ShakeTransition(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: cartlightColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child:
                                  SvgPicture.asset('assets/images/phone.svg'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From Mobile',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  '07:35',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'All >',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                            itemCount: menuController.images.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      menuController.images[index],
                                    ),
                                    // image: NetworkImage(
                                    //   menuController.images[index],
                                    // ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: size.width * 0.3,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FabCircularMenu(
      //   fabChild: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   // fabOpenIcon: Icon(Icons.minimize_outlined),
      //   // fabCloseIcon: Icon(Icons.minimize_outlined),
      //   fabOpenColor: pabBackgroundColor,
      //   ringColor: pablightColor,
      //   ringWidth: 220,
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.all(5),
      //       decoration: BoxDecoration(
      //         color: Colors.orange[100],
      //         borderRadius: BorderRadius.circular(50),
      //       ),
      //       child: IconButton(
      //         onPressed: () {
      //           print('Home click');
      //           Get.to(BankPage());
      //         },
      //         icon: Icon(
      //           Icons.home,
      //           color: pabDarkColor,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(5),
      //       decoration: BoxDecoration(
      //         color: Colors.orange[100],
      //         borderRadius: BorderRadius.circular(50),
      //       ),
      //       child: IconButton(
      //         onPressed: () {
      //           print('Setting click');
      //         },
      //         icon: Icon(
      //           Icons.settings,
      //           color: pabDarkColor,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(5),
      //       decoration: BoxDecoration(
      //         color: Colors.orange[100],
      //         borderRadius: BorderRadius.circular(50),
      //       ),
      //       child: IconButton(
      //         onPressed: () {
      //           print('Profile click');
      //         },
      //         icon: Icon(
      //           Icons.account_circle_rounded,
      //           color: pabDarkColor,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  SizedBox appBarPortion() {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu_outlined,
              color: Colors.white70,
            ),
            Text(
              'Folder',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
