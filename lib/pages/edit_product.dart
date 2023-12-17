import 'package:crud_app_frontend/model/product.dart';
import 'package:crud_app_frontend/services/api.dart';
import 'package:crud_app_frontend/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final Product data;

  const EditProduct({super.key, required this.data});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descriptionController.text = widget.data.description.toString();
  }

  void handleUpdate() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Api.updateProduct(
        widget.data.id,
        {
          "id": widget.data.id,
          "name": nameController.text,
          "price": priceController.text,
          "description": descriptionController.text,
        },
        scaffoldKey.currentContext,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextField(controller: nameController, hintText: "Name"),
                const SizedBox(height: 10.0),
                MyTextField(controller: priceController, hintText: "Price"),
                const SizedBox(height: 10.0),
                MyTextField(
                    controller: descriptionController, hintText: "Description"),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: isLoading ? null : handleUpdate,
                  child: isLoading
                      ? const CircularProgressIndicator() // Show loading indicator
                      : const Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

