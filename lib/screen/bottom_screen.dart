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
  bool play = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'asset/BigBuckBunny.mp4',
    )..initialize().then((value) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                              ),
                              child: Text(
                                'Eiffel Tower',
                                style: AppTextStyle.headingStyle,
                              ),
                            ),
                          ),
                          Hero(
                            tag: 'location',
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.white,
                                  ),
                                  Text(
                                    'Paris, France',
                                    style: AppTextStyle.subHeadingTextStyle,
                                  ),
                                ],
                              ),
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
                      topRight: Radius.circular(16),
                    ),
                    color: AppColor.white,
                  ),
                  constraints: BoxConstraints.tightFor(
                    height: size.height * 0.8,
                    width: size.width,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'pictures',
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: imageWidgetList,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            eiffielTower,
                            style: AppTextStyle.bodyTextStyle,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 15),
                          Stack(
                            children: [
                              SizedBox(
                                width: size.width * 0.9,
                                child: Center(
                                  child: _controller.value.isInitialized
                                      ? AspectRatio(
                                          aspectRatio:
                                              _controller.value.aspectRatio,
                                          child: VideoPlayer(_controller),
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (play) {
                                      _controller.pause();
                                      play = false;
                                    } else {
                                      _controller.play();
                                      play = true;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.play_arrow),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Top Sights',
                            style: AppTextStyle.buttonTextStyle,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'asset/tower1.png',
                                  height: 95,
                                  width: 95,
                                  fit: BoxFit.fill,
                                  isAntiAlias: false,
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                width: size.width * 0.6,
                                child: Text(
                                  france,
                                  style: AppTextStyle.bodyTextStyle,
                                  maxLines: 20,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Hero(
        tag: 'searchButton',
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            constraints: BoxConstraints.tightFor(
              height: size.height * 0.07,
              width: size.width,
            ),
            fillColor: AppColor.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
