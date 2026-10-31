import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june26_provider/controllers/count_controller.dart';
import 'package:provider/provider.dart';

class Counterview extends StatelessWidget {
  const Counterview({super.key});

  @override
  Widget build(BuildContext context) {
   print("build called");
   final provider = Provider.of<CountController>(context);
    return Scaffold(
      body: Column(
        children: [
          // Center(child: Text("${context.watch<CountController>().count}")),
          // Center(child: Text("${provider.count}"))
          // Consumer(builder: builder)
          // Consumer()
          // Consumer<CountController>()
          // Consumer<CountController>(builder: (BuildContext context, CountController value, Widget? child) {  },)
          Consumer<CountController>(builder: (BuildContext context, CountController value, Widget? child) {
            return Center(child: Text("${value.count}"),);
          },)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountController>().increment();
          //provider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// watch : to retrive a value from controller context.watch<CountController>().count
// read(): to call methods of conttoller class  context.read<CountController>().increment();
// final provider = Provider.of<CountController>(context);
// return Scaffold(---
// --
// ----
// ---);
// provider.count
//provider.increment