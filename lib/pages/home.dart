import 'package:crud_app_frontend/pages/create_product.dart';
import 'package:crud_app_frontend/pages/delete_product.dart';
import 'package:crud_app_frontend/pages/fetch_product.dart';
import 'package:crud_app_frontend/pages/update_product.dart';
import 'package:crud_app_frontend/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("What do you want to do?"),
              const SizedBox(height: 20.0),
              MyButton(onPressed: (){
                var createProduct = MaterialPageRoute(builder: (context){
                  return const CreateProduct();
                });
                Navigator.push(context, createProduct);
              }, text: "CREATE"),
              const SizedBox(height: 10.0),
              MyButton(onPressed: (){
                var fetchProduct = MaterialPageRoute(builder: (context){
                  return const FetchProduct();
                });
                Navigator.push(context, fetchProduct);
              }, text: "READ"),
              const SizedBox(height: 10.0),
              MyButton(onPressed: (){
                var updateProduct = MaterialPageRoute(builder: (context){
                  return const UpdateProduct();
                });
                Navigator.push(context, updateProduct);
              }, text: "UPDATE"),
              const SizedBox(height: 10.0),
              MyButton(onPressed: (){
                var deleteProduct = MaterialPageRoute(builder: (context){
                  return const DeleteProduct();
                });
                Navigator.push(context, deleteProduct);
              }, text: "DELETE"),
            ],
          ),
        ),
      ),
    );
  }
}
