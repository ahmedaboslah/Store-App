import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/all_categorize.dart';

import '../services/get_all_product_services.dart';
import '../widget/customwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'Homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
          child: FutureBuilder<List<ProductModel>>(
            future: GetAllProductsServices().getallprodeucts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products =snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 100),
                    itemBuilder: ((context, index) {
                      return customwidget(product: products[index],);
                    }));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
