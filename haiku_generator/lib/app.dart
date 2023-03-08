import 'package:flutter/material.dart';
import 'package:haiku_generator/controller/poem_controller.dart';
import 'package:haiku_generator/controller/product_controller.dart';
import 'package:haiku_generator/widget/shimmer_loading_anim.dart';

import 'models/product.dart';

class HaikuPage extends StatefulWidget {
  const HaikuPage({super.key, required this.title});

  final String title;

  @override
  State<HaikuPage> createState() => _HaikuPageState();
}

class _HaikuPageState extends State<HaikuPage> {
  List<Product> listProduct = [];
  final ProductController productController = ProductController();
  final PoemController poemController = PoemController();

  String haikuText = '';
  String productName = 'Google Search';

  String subTitle = 'Choose a Google product here:';

  Future getProductData() async {
    var productData = await productController.getProduct();
    setState(() {
      listProduct = productData;
    });
  }

  Future getHaikuTextData(String productName) async {
    var poemData = await poemController.getPoem(productName);
    setState(() {
      haikuText = poemData[0].poemText;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _buildTopView(),
                const SizedBox(
                  height: 10.0,
                ),
                _buildBottomView()
              ],
            )),
      ),
    );
  }

  Column _buildTopView() {
    return Column(
      children: <Widget>[
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 150.0,
          child: DropdownButton<Product>(
            items: listProduct.map((Product value) {
              return DropdownMenuItem<Product>(
                value: value,
                child: Text(value.productName),
              );
            }).toList(),
            hint: Text(productName.toString(),
                style: const TextStyle(color: Colors.deepPurpleAccent)),
            underline: Container(
              height: 1,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (value) {
              setState(() {
                productName = value!.productName;
                haikuText = '';
              });
            },
            isExpanded: true,
          ),
        ),
        GestureDetector(
          onTap: () => getHaikuTextData(productName.toString()),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: const Text(
              'Generate haiku!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  Expanded _buildBottomView() {
    return Expanded(
      child: haikuText.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    haikuText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            )
          : ShimmerLoadingAnim(
              isLoading: true,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
    );
  }
}
