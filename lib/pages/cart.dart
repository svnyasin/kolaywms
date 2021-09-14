import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/cart_controller.dart';
import 'package:kolay_wms_mobile/controllers/stock_info_controller.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController barcodeController = TextEditingController();

  StockInfoController listController = Get.find();
  CartController controller = Get.find();

  Future<void> addToCart(String id) async {
    for (var i = 0; i < listController.itemsList.length; i++) {
      if (listController.itemsList[i].id == id) {
        if (!controller.cartList.contains(listController.itemsList[i])) {
          var itemHolder = listController.itemsList[i].copyWith();
          itemHolder.quentity = 1;
          controller.cartList.add(itemHolder);
        } else {
          for (var i = 0; i < controller.cartList.length; i++) {
            if (controller.cartList[i].id == id) {
              controller.cartList[i].quentity++;
            }
          }
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "sale".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "ID",
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.scanBarcode().then((value) {
                              addToCart(value!);
                            });
                          },
                          icon: Icon(Icons.qr_code),
                        ),
                        IconButton(
                          autofocus: false,
                          onPressed: () {
                            addToCart(barcodeController.text);
                          },
                          icon: Icon(Icons.send),
                        ),
                      ],
                    ),
                  ),
                  controller: barcodeController,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: Get.size.height - 400,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          child: controller.cartList.isEmpty
                              ? Center(
                                  child: Text("cart_empty".tr),
                                )
                              : ListView.builder(
                                  itemCount: controller.cartList.length,
                                  itemBuilder: (context, index) => Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Text(controller
                                            .cartList[index].quentity!
                                            .toString()),
                                      ),
                                      title: Text(
                                          controller.cartList[index].brand! +
                                              " (" +
                                              controller.cartList[index].id! +
                                              ")"),
                                      subtitle: Text(
                                          controller.cartList[index].name!),
                                      trailing: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onDoubleTap: () {
                                              setState(() {
                                                controller.cartList[index]
                                                    .quentity = controller
                                                        .cartList[index]
                                                        .quentity -
                                                    100;
                                                if (controller.cartList[index]
                                                        .quentity <
                                                    0) {
                                                  controller.cartList[index]
                                                      .quentity = 0;
                                                }
                                              });
                                            },
                                            onLongPress: () {
                                              setState(() {
                                                controller.cartList[index]
                                                    .quentity = controller
                                                        .cartList[index]
                                                        .quentity -
                                                    10;
                                                if (controller.cartList[index]
                                                        .quentity <
                                                    0) {
                                                  controller.cartList[index]
                                                      .quentity = 0;
                                                }
                                              });
                                            },
                                            onTap: () {
                                              setState(() {
                                                if (controller.cartList[index]
                                                        .quentity >
                                                    0) {
                                                  controller.cartList[index]
                                                      .quentity--;
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onDoubleTap: () {
                                              setState(() {
                                                controller.cartList[index]
                                                    .quentity = controller
                                                        .cartList[index]
                                                        .quentity +
                                                    100;
                                              });
                                            },
                                            onLongPress: () {
                                              setState(() {
                                                controller.cartList[index]
                                                    .quentity = controller
                                                        .cartList[index]
                                                        .quentity +
                                                    10;
                                              });
                                            },
                                            onTap: () {
                                              setState(() {
                                                controller
                                                    .cartList[index].quentity++;
                                              });
                                            },
                                            child: Icon(
                                              Icons.add_circle,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )),
                ),
              ),
              Container(
                height: 60,
                width: 310,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () async {
                          setState(() {
                            controller.cartList.clear();
                          });
                        },
                        child: Text(
                          "clear".tr,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 310,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                  onPressed: () async {
                    controller.updateItems();
                    controller.cartList.clear();
                  },
                  child: Text(
                    "done".tr,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
