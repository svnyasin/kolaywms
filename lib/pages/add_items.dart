import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/add_items_controller.dart';

class AddItems extends GetWidget<AddItemsController> {
  AddItems({Key? key}) : super(key: key);

  final TextEditingController idController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quentityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Add Items",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "ID",
                      suffixIcon: IconButton(
                        onPressed: () => controller
                            .scanBarcode()
                            .then((value) => idController.text = value!),
                        icon: Icon(Icons.qr_code),
                      ),
                    ),
                    controller: idController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Brand",
                    ),
                    controller: brandController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Price",
                    ),
                    controller: priceController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Quentity",
                    ),
                    controller: quentityController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 60,
                    width: 310,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () async {
                        bool isDocExist =
                            await controller.checkDocument(idController.text);
                        if (isDocExist) {
                          controller.updateItem(
                              idController.text,
                              brandController.text,
                              nameController.text,
                              double.parse(priceController.text),
                              int.parse(quentityController.text));
                        } else {
                          controller.addItem(
                              idController.text,
                              brandController.text,
                              nameController.text,
                              double.parse(priceController.text),
                              int.parse(quentityController.text));
                        }
                      },
                      child: Text(
                        "ADD",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
