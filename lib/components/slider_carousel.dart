import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../pages/skin_page.dart';

final Map<String, String> images = {
  "images/1.jpeg": "BBaller",
  "images/2.jpeg": "Pikachu",
  "images/3.jpeg": "Black Teen",
  "images/4.jpeg": "Kakashi",
  "images/5.jpeg": "Travis",
  "images/6.jpeg": "Mickey",
  "images/7.jpeg": "Kakashi2",
};

// ignore: must_be_immutable
class SliderCarousel extends StatelessWidget {
  SliderCarousel({super.key});

  List imageNames = images.keys.toList();

  List title = images.values.toList();

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        carouselController: _controller,
        itemCount: images.length,
        options: CarouselOptions(
          height: 500,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SkinPage(
                    image: imageNames[index],
                    amount: "\$250",
                    name: title[index],
                  ),
                ),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 500,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: title[index],
                            child: Image(
                              image: AssetImage(imageNames[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              title[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.blueGrey,
                              ),
                              itemCount: 5,
                              itemSize: 30,
                              direction: Axis.horizontal,
                            ),
                          )
                        ],
                      ).frosted(
                        blur: 5,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
