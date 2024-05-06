import 'package:diary/presentation/widgets/image_slider.dart';
import 'package:diary/presentation/widgets/round_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final heightFactor = 0.3;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * heightFactor;

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/w_logo.svg', semanticsLabel: 'diary Logo', fit: BoxFit.contain),
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Colors.white)),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ImageSlider(
        images: const [
          "https://i.ibb.co/Dw7851n/23-02-12-FO-LOG-001.png",
          "https://i.ibb.co/Dw7851n/23-02-12-FO-LOG-001.png"
        ],
        indicatorBottomPosition: (height),
        children: [_buildBottomSheet(height)],
      ),
    );
  }

  Widget _buildBottomSheet(double height) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: RoundBottomSheet(
        height: height,
        borderRadius: 20,
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTitles(["오늘의 다요리", "제목", "제목", "제목", "제목"]),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              childAspectRatio: 1.5 / 1,
              children: [
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
                _buildDiary(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildTitles(List<String> titles) {
    return Row(
      children: [
        for (var idx = 0; idx < titles.length; idx++) ...[
          Text(titles[idx], style: idx == 0 ? const TextStyle(fontSize: 14, fontWeight: FontWeight.w700) : null),
          const SizedBox(width: 10),
        ],
      ],
    );
  }

  Widget _buildDiary() {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: Colors.blue),
        ),
        const Row(
          children: [Text("BEST"), Text("NEW")],
        ),
        const Text("어쩌구 저쩌구")
      ],
    );
  }
}
