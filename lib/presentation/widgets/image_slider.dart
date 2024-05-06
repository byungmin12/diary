import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider<T> extends StatefulWidget {
  final List<T> images;
  final double indicatorBottomPosition;
  final List<Widget> children;

  const ImageSlider({super.key, this.images = const [], this.indicatorBottomPosition = 0, this.children = const []});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final _carouselController = CarouselController();
  int activeIndex = 0;

  int get count => widget.images.length;

  _onChangeImageIndex(int index) {
    setState(() {
      _carouselController.jumpToPage(index);
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: count,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final path = widget.images[index];
            return _buildImageItem(path, height);
          },
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) => setState(() {
              activeIndex = index;
            }),
          ),
        ),
        Positioned(bottom: widget.indicatorBottomPosition, child: _buildIndicator()),
        if (widget.children.isNotEmpty) ...widget.children,
      ],
    );
  }

  Widget _buildImageItem(String path, double height) {
    return Center(
        child: Image.network(
      path,
      fit: BoxFit.cover,
      height: height,
      width: double.infinity,
    ));
  }

  Widget _buildIndicator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        onDotClicked: (int index) => _onChangeImageIndex(index),
        effect: JumpingDotEffect(
          dotHeight: 6,
          dotWidth: 6,
          activeDotColor: Colors.white,
          dotColor: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }
}
