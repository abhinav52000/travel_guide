import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/constants/colors.dart';
import 'package:travel_guide/constants/font_constants.dart';
import 'package:travel_guide/constants/literals.dart';
import 'package:travel_guide/constants/widget_list.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  static const id = '/details';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    )..initialize().then((_) {
        print('Hello Abhinav');
        setState(() {});
      }).onError((error, stackTrace) {
        print('abhinav Error $error');
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY:
                    5), // Adjust the sigma values for the desired blur strength
            child: Image.asset(
              'asset/tower.png',
              fit: BoxFit.fitWidth,
            ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                              tag: 'eiffelTower',
                              child: Text('Eiffel Tower',
                                  style: AppTextStyle.headingStyle)),
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
                        ],
                      ),
                      Icon(CupertinoIcons.heart, color: AppColor.white),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: AppColor.white),
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 0.8, width: size.width),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Hero(
                            tag: 'pictures',
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: imageWidgetList,
                                )),
                          ),
                          const SizedBox(height: 15),
                          Text(eiffielTower,
                              style: AppTextStyle.bodyTextStyle,
                              textAlign: TextAlign.justify),
                          const SizedBox(height: 15),
                          Center(
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  )
                                : Image.asset(
                                    'assets/mountain.jpg',
                                    height: 150,
                                    width: size.width,
                                    fit: BoxFit.fitWidth,
                                  ),
                          ),
                        ],
                      ),
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
              Navigator.pop(context);
            },
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            constraints: BoxConstraints.tightFor(
                height: size.height * 0.07, width: size.width),
            fillColor: AppColor.bgColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.flight_takeoff, color: AppColor.white),
                Text(
                  'Search Flights',
                  style: AppTextStyle.bodyText2Style,
                ),
                Chip(
                  label: Text('ON SALE', style: AppTextStyle.bodyText2Style),
                  backgroundColor: AppColor.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
              ],
            )),
      ),
    );
  }
}
