import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june26_provider/controllers/product_controller.dart';
import 'package:june26_provider/models/Products.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Productview extends StatefulWidget {
  const Productview({super.key});

  @override
  State<Productview> createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  @override
  void initState() {
    super.initState();

    // context.read();
    // context.read<ProductController>();
    Future.microtask(() {
      if (mounted) {
        context.read<ProductController>().fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Consumer<ProductController>(
        builder:
            (BuildContext context, ProductController value, Widget? child) {
              if (value.isloading) {
                return _shimmerview();
              }
              if (value.plist.isEmpty) {
                return _emptyview();
              }
              if (value.errMsg.isNotEmpty) {
                return _errorview(value.errMsg);
              }
              if (value.plist.isNotEmpty) {
                return _productlist(value.plist);
              } else {
                return _shimmerview();
              }
            },
      ),
    );
  }

  Widget _shimmerview() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        padding: .all(12),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 270,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Container(decoration: BoxDecoration(color: Colors.white,borderRadius: .circular(12)),);
        },
      ),
    );
  }

  Widget _emptyview() {
    return Center(child: Text("No data"),);
  }
  Widget _errorview(String errMsg) {
    return Center(child: Text("${errMsg}"),);
  }
  Widget _productlist(List<Products> plist) {
   return GridView.builder(
      padding: .all(12),
      itemCount: plist.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 270,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("${plist[index].image}")),
            color: Colors.blue.shade100,
            borderRadius: .circular(12)),);
      },
    );
  }
}
