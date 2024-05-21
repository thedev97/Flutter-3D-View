import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_viewer/screens/page_3d.dart';
import 'package:flutter_3d_viewer/screens/widgets/page_3d_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Page3DView page3dView;

  late PageController _controller;
  double fraction = 0.50;

  @override
  void initState() {
    super.initState();
    page3dView = Page3DView(value: 2.0);
    _controller = PageController(initialPage: 2, viewportFraction: fraction);
    _controller.addListener(() {
      page3dView.setValue(_controller.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "3D View",
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    const Shadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 3),
                  ]),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Eternal rhythms, timeless beauty\nNature forever.",
                    style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          const Shadow(
                              color: Colors.black54,
                              offset: Offset(2, 2),
                              blurRadius: 3),
                        ]),
                    maxLines: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: ChangeNotifierProvider<Page3DView>.value(
                  value: page3dView,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Page3D(
                          number: index.toDouble(), fraction: fraction);
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
