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

  List _resultsList = [].obs;

  @override
  void initState() {
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
        if (brand.contains(_searchController.text.toLowerCase())) {
          showResults.add(controller.itemsList[i]);
        }
      }
    } else {
      showResults = controller.itemsList;
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Stock",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: "Search",
                hintText: "Ürün markası giriniz"),
            controller: _searchController,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Obx(
          () => Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1)),
            child: ListView.builder(
              itemCount: _resultsList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(_resultsList[index].quentity!.toString()),
                  ),
                  title: Text(_resultsList[index].brand! +
                      " (" +
                      _resultsList[index].id! +
                      ")"),
                  subtitle: Text(_resultsList[index].name!),
                  trailing: Text(_resultsList[index].price!.toString() + "₺"),
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
