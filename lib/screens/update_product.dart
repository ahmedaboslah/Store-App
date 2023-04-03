import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/updateProduct.dart';

import '../widget/FieldcustomeText.dart';
import '../widget/customebutton.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static String id = 'updateprodictpage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname, dsc, image;

  String? price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  obscure: false,
                  HintText: 'product name',
                  onChange: (data) {
                    productname = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscure: false,
                    HintText: 'discription ',
                    onChange: (data) {
                      dsc = data;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    inputType: TextInputType.number,
                    obscure: false,
                    HintText: 'price ',
                    onChange: (data) {
                      price = data;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscure: false,
                    HintText: 'image ',
                    onChange: (data) {
                      image = data;
                    }),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  ontap: (() async{
                    isloading = true;
                    setState(() {});
                    try {
                      await UPdateProduct(product);
                      print('success');
                    }   catch (e) {
                      print(e.toString());
                     
                    }
                      isloading=false;
                      setState(() {});
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UPdateProduct(ProductModel product) async{
   await UpdateProductservice().Updateproduct(
        id: product.id,
        title: productname == null ? product.title : productname!,
        price: price == null ? product.price.toString() : price!,
        desc: dsc == null ? product.description : dsc!,
        image: image == null ? product.image : image!,
        Category: product.description);
  }
}
