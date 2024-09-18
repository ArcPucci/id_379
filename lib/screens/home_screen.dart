import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gif/gif.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final GifController _controller;
  bool _tapped = false;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final list = <_Article>[
    _Article(
      id: 0,
      title: 'History',
      asset: 'assets/png/spinning_top_0.png',
      content:
          "Spinning tops developed independently in cultures all over the world. They are among the oldest recognizable toys found by archaeologists and have been found on every continent except Antarctica. Tops found in China date from around 1250 BCE. A carved wooden top dated to about 2000 BCE was found in King Tut’s tomb. (Picture of King Tut’s top) A clay top discovered at an archaeological site in Iraq dates to 3,500 BCE. That’s almost six thousand years ago!",
    ),
    _Article(
      id: 1,
      title: 'Materials',
      asset: 'assets/png/spinning_top_1.png',
      content:
          "The materials used to make tops has varied depending on place and time. Very primitive tops made from seeds, nuts, or fruits with a stick through them have been found among indigenous peoples throughout the world. Other materials used to make tops are wood, bone, fired clay, ivory, shells, and metals like iron, brass, silver, or gold. Most tops are solid, but some were hollow with a hole in the side that produced a whistling sound.",
    ),
    _Article(
      id: 2,
      title: 'Use',
      asset: 'assets/png/spinning_top_2.png',
      content:
          """Originally tops were used to amuse children; however, people soon found other uses for this ancient toy. 
They were used as gifts to honor the gods and were placed in burials for the dead to take into the afterlife. In some cultures, tops were spiritual objects used for divination and prophecy. Organized sports and games developed using tops. And, they were used for gambling.
""",
    ),
    _Article(
      id: 3,
      title: 'Types',
      asset: 'assets/png/spinning_top_3.png',
      content:
          """There are different types of spinning tops. Depending on how tops are spun they are called finger twirlers, strings and whips, augers, or magnetic fields, but they all defy gravity. Tops are designed to spin, balancing on the tip. They stay in motion and upright until they lose energy and tip over. In the Museum’s collections we have two examples of string and whip tops:

Gasing, Sarawak, Malaysia. This hand-carved wooden top is made of a dense hardwood. It is used in a traditional game where the top is spun, and the winner is the person whose gasing spins the longest. The woven rope is unique because it is thicker on the end that is held in the hand and tapers down to the end that is wrapped around the gasing. The gasing is thrown and the rope is jerked back causing the top to spin. In another game, one player tries to knock the other player’s gasing out of a ring that is drawn on the ground.""",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _tapped ? _buildPageView() : _buildIdleBody();
  }

  Widget _buildIdleBody() {
    return Column(
      children: [
        Gap(18.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text("About\nSpinning\nTop", style: AppTextStyles.extraBold48),
        ),
        Gap(63.h),
        Image.asset(
          'assets/png/tiger2.png',
          width: 333.w,
          height: 287.h,
        ),
        const Spacer(),
        CustomButton1(
          text: "Begin",
          height: 40.h,
          onTap: onBegin,
        ),
        Gap(19.h),
      ],
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      width: 375.w,
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          ...List.generate(
            list.length,
            (index) => _buildArticle(list[index]),
          ),
          _buildAnim(),
        ],
      ),
    );
  }

  Widget _buildArticle(_Article article) {
    return Column(
      children: [
        Gap(23.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text(
            article.title,
            style: AppTextStyles.extraBold48,
            textAlign: TextAlign.center,
          ),
        ),
        Gap(32.h),
        Image.asset(
          article.asset,
          width: 124.w,
          height: 124.h,
        ),
        Gap(32.h),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              article.content,
              style: AppTextStyles.medium16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnim() {
    return Column(
      children: [
        Gap(23.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text(
            "Trajectory",
            style: AppTextStyles.extraBold48,
            textAlign: TextAlign.center,
          ),
        ),
        Gap(40.h),
        Gif(
          width: 375.w,
          height: 375.h,
          image: const AssetImage("assets/gif/anim.gif"),
          controller: _controller,
          // if duration and fps is null, original gif fps will be used.
          autostart: Autostart.loop,
          placeholder: (context) => const Text('Loading...'),
          onFetchCompleted: () {
            _controller.reset();
            _controller.forward();
          },
        ),
      ],
    );
  }

  void onBegin() {
    _tapped = true;
    setState(() {});
  }
}

class _Article {
  final int id;
  final String title;
  final String asset;
  final String content;

  _Article({
    required this.id,
    required this.title,
    required this.asset,
    required this.content,
  });
}
