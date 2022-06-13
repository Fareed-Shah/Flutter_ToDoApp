import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<String> ListName = ['Fareed','Shah'];
  @override
  Widget build(BuildContext context) {
   return Scaffold(    
    appBar: AppBar(title: Text('Dashboard'),),

    body:  
    Center(
      child: Column(    
        
        children: [
          Container(
            height: 50,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Name',                
              ),
            )),
            ElevatedButton(onPressed: (){}, child: Text('Add')),
            
            Expanded(
              child: ListView.builder(
                itemCount: ListName.length,
                itemBuilder: (BuildContext context,index){
                 return  ListTile(
                  tileColor: Colors.grey,
                  title: Text(ListName[index]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(                    
                      children: [                        
                        Icon(Icons.delete),
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                 );
                }
                
                ),
            )
        ],
      ),
    ),
   );
  }
}