import 'package:crud_app_frontend/model/product.dart';
import 'package:crud_app_frontend/services/api.dart';
import 'package:crud_app_frontend/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  void handleSubmit(){
    var data = {
      "name": nameController.text,
      "price": priceController.text,
      "description": descriptionController.text,
    };
    Api.addProduct(data);

    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextField(controller: nameController, hintText: "Name"),
                  const SizedBox(height: 10.0),
                  MyTextField(controller: priceController, hintText: "Price"),
                  const SizedBox(height: 10.0),
                  MyTextField(controller: descriptionController, hintText: "Description"),
                  const SizedBox(height: 10.0),

                  ElevatedButton(onPressed: handleSubmit, child: const Text("Submit")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
