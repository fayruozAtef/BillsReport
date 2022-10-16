import 'package:flutter/material.dart';

class BranchDetailsScreen extends StatelessWidget {
  const BranchDetailsScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal[100],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              Text("إجمالى المبيعات: ",style:  TextStyle(fontSize: 22.0),),
              SizedBox(height: 25.0,),
              Text("قيمة الضرائب: ",style:  TextStyle(fontSize: 22.0),),
              SizedBox(height: 25.0,),
              Text("قيمة الخصم: ",style:  TextStyle(fontSize: 22.0),),
            ],
          ),
        ),
      ),
    );
  }
}
