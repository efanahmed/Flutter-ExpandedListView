import 'package:flutter/material.dart';

class ExpanstionList extends StatefulWidget {
  const ExpanstionList({Key? key}) : super(key: key);

  @override
  _ExpanstionListState createState() => _ExpanstionListState();
}

class _ExpanstionListState extends State<ExpanstionList> {
  List<Item> _data = generateItems(20);

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpandad = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext contex, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandadValue),
              subtitle:const  Text('To delete this panel,tap the tradh can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpandad);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanstion List"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        ),
      ),
    );
  }
}

class Item {
  String expandadValue;
  String headerValue;
  bool isExpandad;

  Item(
      {required this.expandadValue,
      required this.headerValue,
      this.isExpandad = false});
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
      headerValue: 'Panel $index',
      expandadValue: 'This is item number $index',
    );
  });
}
