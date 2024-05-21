import 'package:flutter/material.dart';
import 'package:flutter_3d_viewer/screens/widgets/page_3d_view.dart';
import 'package:flutter_3d_viewer/utils/image_constants.dart';
import 'package:provider/provider.dart';

class Page3D extends StatelessWidget {
  final double number;
  final double fraction;

  const Page3D({super.key, required this.number, required this.fraction});

  @override
  Widget build(BuildContext context) {
    double value = Provider.of<Page3DView>(context).value;
    double diff = number - value;

    Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1.0)
      ..setEntry(3, 0, 0.008 * -diff);

    Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.6)
      ..setEntry(3, 1, -0.004)
      ..setEntry(3, 0, 0.002 * diff)
      ..rotateX(1.309);

    String imagePath;
    switch (number.toInt()) {
      case 1: imagePath = ImageConstants.img1; break;
      case 2: imagePath = ImageConstants.img2; break;
      case 3: imagePath = ImageConstants.img3; break;
      case 4: imagePath = ImageConstants.img4; break;
      case 5: imagePath = ImageConstants.img5; break;
      case 6: imagePath = ImageConstants.img6; break;
      case 7: imagePath = ImageConstants.img7; break;
      case 8: imagePath = ImageConstants.img8; break;
      case 9: imagePath = ImageConstants.img9; break;
      default: imagePath = ImageConstants.img10;
    }

    return Column(
      children: <Widget>[
        Transform(
          transform: pvMatrix,
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: MediaQuery.of(context).size.height * 0.65,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        if (diff.abs() <= 1.0)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1 - diff.abs(),
            child: Transform(
              transform: shadowMatrix,
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 75,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
