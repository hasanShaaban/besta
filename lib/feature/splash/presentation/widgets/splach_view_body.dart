import 'package:besta/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {

      late GifController _gifController;
      bool _moveLeft = false;

      @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gifController.animateTo(10, duration: const Duration(seconds: 2)).whenComplete((){
        setState(() {
          _moveLeft = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _gifController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedAlign(
        alignment: _moveLeft? Alignment.centerLeft : Alignment.center,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
        child: Gif(
          width: 100,
          image: const AssetImage(Assets.imagesLogo),
          controller: _gifController,
          autostart: Autostart.once,
        ),
      ),
    );
  }
}
