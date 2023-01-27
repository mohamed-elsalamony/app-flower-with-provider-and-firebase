import 'package:app_flowers2/pages/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_flowers2/prvider/Card.dart';

class Cheeck extends StatelessWidget {
  const Cheeck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final classcartInstancee = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 76, 141, 95),
          title: Text("Check out"),
          actions: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(211, 164, 255, 193),
                            shape: BoxShape.circle),
                        child: Text(
                          "${classcartInstancee.selectedproduct.length}",
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        )),
                    IconButton(
                        onPressed: () {
                          
                        }, icon: const Icon(Icons.add_shopping_cart)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text("\$ ${classcartInstancee.price}"),
                )
              ],
            )
          ],
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: classcartInstancee.selectedproduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(classcartInstancee
                                .selectedproduct[index].nameproduct),
                            subtitle: Text(
                                "${classcartInstancee.selectedproduct[index].price}-${classcartInstancee.selectedproduct[index].location}"),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(classcartInstancee
                                  .selectedproduct[index].imgPath),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  classcartInstancee.removeProduct(classcartInstancee.selectedproduct[index]);
                                }, icon: Icon(Icons.remove)),
                          ),
                        );
                      })),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Pay \$${classcartInstancee.price}",
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ));
  }
}
