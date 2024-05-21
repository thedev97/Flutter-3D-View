import 'package:flutter/material.dart';
import 'package:flutter_3d_viewer/screens/widgets/page_3d_view.dart';
import 'package:flutter_3d_viewer/utils/image_constants.dart';
import 'package:provider/provider.dart';

class Page3D extends StatelessWidget {
  final double number;
  final double fraction;

  const Page3D({super.key, required this.number, required this.fraction});

  final int? imgNum = 0;

  @override
  Widget build(BuildContext context) {
    double value = Provider.of<Page3DView>(context).value;
    double diff = (number - value);

    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1.0 / 1.0)
      ..setEntry(1, 1, 1.0)
      ..setEntry(3, 0, 0.008 * -diff);

    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.6)
      ..setEntry(3, 1, -0.004)
      ..setEntry(3, 0, 0.002 * diff)
      ..rotateX(1.309);

    return Column(
      children: <Widget>[
        Transform(
          transform: pvMatrix,
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white54,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                height: MediaQuery.of(context).size.height * 0.65,
                number == 1
                    ? ImageConstants.img1
                    : number == 2
                    ? ImageConstants.img2
                    : number == 3
                    ? ImageConstants.img3
                    : number == 4
                    ? ImageConstants.img4
                    : number == 5
                    ? ImageConstants.img5
                    : number == 6
                    ? ImageConstants.img6
                    : number == 7
                    ? ImageConstants.img7
                    : number == 8
                    ? ImageConstants.img8
                    : number == 9
                    ? ImageConstants.img9
                    : ImageConstants.img10,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        if (diff <= 1.0 && diff >= -1.0) ...[
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
      ],
    );
  }
}
