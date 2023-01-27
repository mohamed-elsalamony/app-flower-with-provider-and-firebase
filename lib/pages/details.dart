

import 'package:app_flowers2/pages/model.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Details extends StatefulWidget {
  
Item product ;
Details({required this.product});


  
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Details"),
        
),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(widget.product.imgPath),
              SizedBox(height: 15,),
              Text("\$ ${widget.product.price}",style: TextStyle(fontSize: 20),),
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Text("New",style: TextStyle(fontSize: 15),),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 129, 129),
                      borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                   SizedBox(width: 20,),
                 Row(
                  children: [
                    
                     Icon(Icons.star,size: 25,color: Colors.amber,),
                     Icon(Icons.star,size: 25,color: Colors.amber,),
                     Icon(Icons.star,size: 25,color: Colors.amber,),
                     Icon(Icons.star,size: 25,color: Colors.amber,),
                     Icon(Icons.star,size: 25,color: Colors.amber,),
      
                  ],
                 ),
                SizedBox(width: 65,),
                 Row(
                  children: [
                    Icon(Icons.edit_location,size: 25,color: Color.fromARGB(255, 1, 49, 3),),
                    SizedBox(width: 5,),
                    Text("Flower Shop",style: TextStyle(fontSize: 18),)
                  ],
                 ),
                ],
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: double.infinity,
                child: Text("Details :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.start,)),
               SizedBox(height: 18,),
               Text("A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). The biological function of a flower is to facilitate reproduction, usually by providing a mechanism for the union of sperm with eggs. Flowers may facilitate outcrossing (fusion of sperm and eggs from different individuals in a population) resulting from cross-pollination or allow selfing (fusion of sperm and egg from the same flower) when self-pollination occurs.",
               style: TextStyle(fontSize: 18),
               maxLines: isShow? 3 : null,
               overflow: TextOverflow.fade,
               ),
               TextButton(onPressed: (){
                setState(() {
                  isShow= !isShow;
                });
               }, 
               child: Text(isShow? "Show More" : "Show Less",style: TextStyle(fontSize: 18),
            
      
               ),
               
               
               )
      
            ],
          ),
        ),
      )
    );
  }
}
