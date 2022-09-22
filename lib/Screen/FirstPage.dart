import 'package:flutter/material.dart';
import 'package:mitesh1/Screen/SecondPage.dart';

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<data> l1 = [];
  TextEditingController txt_id = TextEditingController();
  TextEditingController txt_name = TextEditingController();
  TextEditingController txt_std = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              ShowAlertDialog(context);
            },
          ),
          body: ListView.builder(
              itemCount: l1.length,
              itemBuilder: (Context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${l1[index].id1}"),
                            Text("${l1[index].name1}"),
                            Text("${l1[index].std1}"),
                            IconButton(
                                onPressed: () {
                                 setState(() {
                                   l1.removeAt(index);
                                 });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black45,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  void ShowAlertDialog(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: Column(
        children: [
          TextField(
            controller: txt_id,
            decoration: InputDecoration(
              hintText: "Enter your Id",
            ),
          ),
          TextField(
            controller: txt_name,
            decoration: InputDecoration(
              hintText: "Enter your Name",
            ),
          ),
          TextField(
            controller: txt_std,
            decoration: InputDecoration(
              hintText: "Enter your Std",
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                l1.add(data(txt_id.text, txt_name.text, txt_std.text));
              });
            },
            child: Text("Ok"))
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
