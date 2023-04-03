import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product.dart';
class customwidget extends StatelessWidget {
 customwidget({required this.product});
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
           
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 1,
                  offset: Offset(10,10)
                )
              ]
            ),
            child: Card(
              elevation: 10,
              
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('${product.title.substring(0,6)}',style: TextStyle(color: Colors.grey,fontSize: 16),),
                SizedBox(height: 3,),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(r'$''${product.price}',style: TextStyle(color: Colors.black,fontSize: 16),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                ],)    
                  ]),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 85,
            child: Image.network(product.image,height: 100,width: 100,))
        ],
      ),
    );
  }
}
