import 'dart:math';
import 'package:flutter/material.dart';

const kImageSize1 = 200.0;

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({super.key});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  double currentPixel = 0;
  int itemCount = 3;
  int previousIndex = -1;
  bool isScrolling = false;
  final scrollController = ScrollController();

  final coverArts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraint) {
        double calcCardLocation({double? pixel, required double itemSize, int? index}) {
          //current pixel: pixel
          //listPadding is not considered as moving pixel by scroll (0.0 is after padding)
          //substracted by itemSize/2 (to center the item)
          //divided by pixels taken by each item
          int cardIndex = index ?? ((pixel! - itemSize / 2) / itemSize).ceil();

          //Avoid index getting out of bounds
          if (cardIndex < 0) {
            cardIndex = 0;
          } else if (cardIndex > itemCount - 1) {
            cardIndex = itemCount - 1;
          }

          //trigger onItemFocus
          if (cardIndex != previousIndex) {
            previousIndex = cardIndex;
          }

          //target position
          return (cardIndex * itemSize);
        }

        void animateScroll(double location) {
          Future.delayed(Duration.zero, () {
            scrollController.animateTo(
              location,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        }

        return GestureDetector(
          //by catching onTapDown gesture, it's possible to keep animateTo from removing user's scroll listener
          onTapDown: (_) {},
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              //Check if the received gestures are coming directly from the ScrollSnapList. If not, skip them
              //Try to avoid inifinte animation loop caused by multi-level NotificationListener
              if (scrollInfo.depth > 0) {
                return false;
              }

              if (scrollInfo is ScrollStartNotification) {
                setState(() {
                  isScrolling = true;
                });
              }

              if (scrollInfo is ScrollEndNotification) {
                setState(() {
                  isScrolling = false;
                });
                //snap the selection
                double offset = calcCardLocation(
                  pixel: scrollInfo.metrics.pixels,
                  itemSize: kImageSize1,
                );

                //only animate if not yet snapped (tolerance 0.01 pixel)
                if ((scrollInfo.metrics.pixels - offset).abs() > 0.05) {
                  animateScroll(offset);
                }
              } else if (scrollInfo is ScrollUpdateNotification) {
                //save pixel position for scale-effect
                setState(() {
                  currentPixel = scrollInfo.metrics.pixels;
                });
              }
              return false;
            },
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
              padding: EdgeInsets.symmetric(
                horizontal: max(0, (constraint.maxWidth / 2) - kImageSize1 / 2),
              ),
              itemCount: itemCount,
              itemBuilder: (ctx, i) {
                double calcScale() {
                  double intendedPixel = i * kImageSize1;
                  double difference = intendedPixel - currentPixel;
                  return 1 - min(difference.abs() / 500, 0.32);
                }

                return Center(
                  child: Transform.scale(
                    scale: calcScale(),
                    child: Image.asset(
                      coverArts[i],
                      width: kImageSize1,
                      height: kImageSize1,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
