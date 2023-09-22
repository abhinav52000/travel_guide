import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/constants/colors.dart';
import 'package:travel_guide/constants/font_constants.dart';
import 'package:travel_guide/constants/widget_list.dart';
import 'package:travel_guide/screen/bottom_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const id = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'asset/tower.png',
            fit: BoxFit.fitWidth,
            colorBlendMode: BlendMode.colorBurn,
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.arrow_down, color: AppColor.white),
                      Icon(CupertinoIcons.heart, color: AppColor.white),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Chip(
                        label:
                            Text('ON SALE', style: AppTextStyle.bodyText2Style),
                        backgroundColor: AppColor.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      const SizedBox(height: 10),
                      Hero(
                          tag: 'eiffelTower',
                          child: Text('Eiffel Tower',
                              style: AppTextStyle.headingStyle)),
                      const SizedBox(height: 10),
                      Hero(
                        tag: 'location',
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: AppColor.white),
                            Text('Paris, France',
                                style: AppTextStyle.subHeadingTextStyle),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: AppColor.white),
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 0.2, width: size.width),
                    child: Hero(
                      tag: 'pictures',
                      child: SizedBox(
                          height: 85,
                          width: 85,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: imageWidgetList,
                              ))),
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, DetailScreen.id);
            },
            padding: const EdgeInsets.all(5),
            constraints: BoxConstraints.tightFor(
                height: size.height * 0.05, width: size.height * 0.05),
            shape: const CircleBorder(),
            fillColor: AppColor.bgColor,
            child: Icon(Icons.flight_takeoff, color: AppColor.white)),
      ),
    );
  }
}
