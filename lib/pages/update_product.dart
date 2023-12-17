import 'package:crud_app_frontend/model/product.dart';
import 'package:crud_app_frontend/pages/edit_product.dart';
import 'package:crud_app_frontend/services/api.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Page"),),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            } else if (snapshot.data.length == 0) {
              return const Center(
                child: Text('No Data to update '),
              );
            } else {
              List<Product> product = snapshot.data;

              return ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3.0),
                      elevation: 3,
                      // You can adjust the elevation for a shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text("${product[index].name}"),
                        subtitle: Text("${product[index].description}"),
                        leading: Container(
                          height: 50,
                          width: 50,
                          child:
                              Center(child: Text("R${product[index].price}")),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProduct(data: product[index]),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
