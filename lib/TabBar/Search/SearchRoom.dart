import 'package:rende/ItemCards/SearchCard.dart';
import 'package:rende/TabBar/Search/Catalog.dart';
import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class SearchTool extends StatefulWidget {
  SearchTool({Key key, this.title, this.searchName}) : super(key: key);
  final String title;
  final String searchName;

  @override
  _SearchToolState createState() => new _SearchToolState();
}

class _SearchToolState extends State<SearchTool> {
  TextEditingController editingController = TextEditingController();

  final List<SearchCard> itemList = List<SearchCard>();
  var items = List<SearchCard>();

  @override
  void initState() {
    addItems(itemList, context);
    super.initState();
  }

  String _searchName() {
    if (widget.searchName == null) {
      return "Search";
    } else
      return widget.searchName;
  }

  void filterSearchResults(String query) {
    List<SearchCard> dummySearchList = List<SearchCard>();

    dummySearchList.addAll(itemList);
    if (query.isNotEmpty) {
      List<SearchCard> dummyListData = List<SearchCard>();
      dummySearchList.forEach((item) {
        SearchCard temp = item;
        if (item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.desc.toLowerCase().contains(query.toLowerCase()) ||
            item.tags.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(temp);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(itemList);
      });
    }
  }

  ListView foundList(List<SearchCard> cards) {
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return cards[index];
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 1.89) {
      height *= 0.95;
      width *= 1.14;
    }

    return Material(
      color: alexa,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      child: Container(
        ///
        ///
        ///Color of background of the alert dialog

        decoration: BoxDecoration(),

        child: Container(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.01, bottom: 10, left: 40, right: 40),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  style: TextStyle(color: white1, fontWeight: FontWeight.w500),
                  cursorColor: Colors.white,
                  controller: editingController,
                  decoration: InputDecoration(
                    suffixIcon: editingController.text.length > 0
                        ? IconButton(
                            onPressed: () => editingController.clear(),
                            icon: Icon(
                              Icons.cancel,
                              color: alexaYellow,
                            ),
                          )
                        : Container(
                            width: 100,
                          ),
                    labelText: _searchName(),
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(left: width * 0.013),
                    //Regular Border
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: offw,
                          width: 2,
                        )),
                    //On Press border
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: offw,
                          width: 2,
                        )),
                  ),
                ),
              ),
              Container(
                  height: (height * 0.20) + 7,
                  child: Scrollbar(child: foundList(items))),
            ],
          ),
        ),
      ),
    );
  }
}
