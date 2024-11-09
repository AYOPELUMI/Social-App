import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/home_controller.dart';

class RecentlyBorrowed extends StatelessWidget {
  const RecentlyBorrowed({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: false,
        padEnds: false,
        disableCenter: true,
        viewportFraction: 0.4,
      ),
      items: controller.recentlyBorrowed.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 127,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4DADA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              // Only trigger state update when the user interacts, not during build
                            },
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                              size: 20,
                              fill: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  item,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
