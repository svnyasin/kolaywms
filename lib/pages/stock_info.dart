import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/stock_info_controller.dart';

class StockInfo extends StatefulWidget {
  StockInfo({Key? key}) : super(key: key);

  @override
  _StockInfoState createState() => _StockInfoState();
}

class _StockInfoState extends State<StockInfo> {
  final TextEditingController _searchController = TextEditingController();

  var controller = Get.find<StockInfoController>();

  List resultsList = [];

  @override
  void initState() {
    controller.itemsList.bindStream(controller.getItems());
    super.initState();
    _searchController.addListener(_onSearchChanged);
    searchResultsList();
  }

  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var i = 0; i < controller.itemsList.length; i++) {
        var brand = controller.itemsList[i].brand.toLowerCase();
        var id = controller.itemsList[i].id.toLowerCase();
        if (brand.contains(_searchController.text.toLowerCase()) ||
            id.contains(_searchController.text.toLowerCase())) {
          showResults.add(controller.itemsList[i]);
        }
      }
    } else {
      showResults = controller.itemsList;
    }
    setState(() {
      resultsList = showResults;
    });
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
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "stock".tr,
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
                  suffixIcon: Icon(Icons.search),
                  labelText: "search".tr,
                  hintText: "search_hint".tr),
              controller: _searchController,
              autofocus: false,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Obx(
              () => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: resultsList.isEmpty
                      ? Center(
                          child: Text("stock_empty".tr),
                        )
                      : ListView.builder(
                          itemCount: resultsList.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              onLongPress: () {
                                Get.defaultDialog(
                                    onConfirm: () {
                                      controller
                                          .deleteItem(resultsList[index].id!);
                                      Get.back();
                                    },
                                    title: "Öğe Silinecek",
                                    textConfirm: "Yes",
                                    textCancel: "No",
                                    content: Text("Onaylıyor musunuz?"));
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                    resultsList[index].quentity!.toString()),
                              ),
                              title: Text(resultsList[index].brand! +
                                  " (" +
                                  resultsList[index].id! +
                                  ")"),
                              subtitle: Text(resultsList[index].name!),
                              trailing:
                                  Text(resultsList[index].price!.toString()),
                            ),
                          ),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
