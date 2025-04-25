import 'package:besta/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  double appBarHeight = 180; // Start expanded
  final double minHeight = 80; // Minimum collapsed height

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    double offset = scrollController.offset;

    setState(() {
      // Decrease height based on scroll, but never less than minHeight
      appBarHeight = (180 - offset).clamp(minHeight, 180);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Container(height: MediaQuery.of(context).size.height + 50),
        ),
        CustomAppBar(appBarHeight: appBarHeight),
      ],
    );
  }
}


// // This is the scrollable content
        // Padding(
        //   padding: EdgeInsets.only(top: appBarHeight),
        //   child: ListView.builder(
        //     controller: scrollController,
        //     itemCount: 30,
        //     itemBuilder: (context, index) => ListTile(
        //       title: Text('عنصر رقم $index'),
        //     ),
        //   ),
        // ),
