import 'package:fire_drive/views/widgets/shadow.dart';
import 'package:flutter/material.dart';

class DetailScreenImageBox extends StatelessWidget {
  const DetailScreenImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeuBox(
        child: Container(
          height: height * 0.33,
          width: width * 0.96,
          decoration: const BoxDecoration(
            color: Colors.grey,
            border: BorderDirectional(),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Center(
                  child: SizedBox(
                    height: 290,
                    width: 370,
                    child: Image.asset(
                      'assets/images/polo_red.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
