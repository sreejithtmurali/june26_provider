import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june26_provider/controllers/colorcontroller.dart';
import 'package:provider/provider.dart';

class Colorview extends StatelessWidget {
  const Colorview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Colorcontroller>(
          builder:
              (BuildContext context, Colorcontroller value, Widget? child) {
                return IconButton(
                  onPressed: () {
                    value.ChangeColor();
                  },
                  icon: Icon(Icons.light,color: value.color, size: 100),
                );
              },
        ),
      ),
    );
  }
}
