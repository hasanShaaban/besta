import 'package:besta/core/utils/assets.dart';
import 'package:besta/feature/on_boarding/presentation/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin{
  bool _slideLeft = false;
  bool _showText = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        _slideLeft = true;
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          _showText = true;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.48,
            child: AnimatedOpacity(
              curve: Curves.easeInCubic,
              duration: const Duration(milliseconds: 1000),
              onEnd: () {
                Future.delayed(const Duration(seconds: 1), (){
                  Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
                });
              },
              opacity: _showText ? 1.0 : 0.0,
              child: SvgPicture.asset(
                Assets.iconsEsta, // Replace with your actual asset path
                height: 61,
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInCirc,
            alignment: _slideLeft ? const Alignment(-0.5, 0) : Alignment.center,
            child: Gif(
              image: const AssetImage(Assets.imagesLogo),
              autostart: Autostart.once,
              height: 250,
              width: _slideLeft? 120 : 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
