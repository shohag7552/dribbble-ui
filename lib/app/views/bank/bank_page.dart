import 'package:dribbble_ui_design/app/combines/colors.dart';
import 'package:dribbble_ui_design/app/combines/pie_chart_section.dart';
import 'package:dribbble_ui_design/app/combines/shadow.dart';
import 'package:dribbble_ui_design/app/views/bank/bank_controller.dart';
import 'package:dribbble_ui_design/app/views/bank/card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BankPage extends StatelessWidget {
  BankPage({Key? key}) : super(key: key);

  final BankController bankController = Get.put(BankController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width / 2;

    bankController.expenses.forEach((element) {
      bankController.money = bankController.money + element['ammount'];
    });
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: appBarPart(),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Card Selected',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return bankCard(context);
                        }),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monthly Expenses',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: kBackgroundColor,
                                    boxShadow: customShadow),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: kTextColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: kBackgroundColor,
                                    boxShadow: customShadow),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: kTextColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      // child: PieChart(
                      //   PieChartData(
                      //     sections: getSection(),
                      //     borderData: FlBorderData(show: false),
                      //     sectionsSpace: 0,
                      //     startDegreeOffset: 0,
                      //     centerSpaceRadius: 50,
                      //   ),
                      // ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 50),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: bankController.expenses
                                    .map((e) => Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  bankController.pieColors[
                                                      bankController.expenses
                                                          .indexOf(e)],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              e['name'],
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kBackgroundColor,
                                  boxShadow: customShadow,
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(34.0),
                                      child: PieChart(
                                        PieChartData(
                                          sections: getSection(),
                                          borderData: FlBorderData(show: false),
                                          sectionsSpace: 0,
                                          startDegreeOffset: 0,
                                          centerSpaceRadius: 40,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        //height: height/2,
                                        width: width / 2.35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kBackgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blue[900]!
                                                    .withOpacity(0.5),
                                                spreadRadius: -4,
                                                offset: const Offset(7, 7),
                                                blurRadius: 20),
                                          ],
                                        ),
                                        child: Center(
                                            child: Text(
                                          '\$${bankController.money}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor,
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget bankCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      width: MediaQuery.of(context).size.width / 1.125,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        boxShadow: customShadow,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: -200,
            left: 100,
            right: 50,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white12,
              ),
            ),
          ),
          Positioned.fill(
            left: -200,
            bottom: -50,
            top: -50,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white24,
              ),
            ),
          ),
          CardDetails(),
        ],
      ),
    );
  }

  Widget appBarPart() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mehedi\'s Account',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: customShadow,
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
