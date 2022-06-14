import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<String> Todo_List = ['Fareed','Shah'];
   
  TextEditingController addtextcontroller =TextEditingController();

  Addtodo_List(){    
    setState(() {
      
    Todo_List.add(addtextcontroller.text);
    addtextcontroller.clear();
//    print(addtextcontroller.text);  
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(    
    appBar: AppBar(title: Text('To Do List'),centerTitle: true,),

    body:  
    Center(
      child: Column(    
        
        children: [                    
          Container(
            margin: EdgeInsets.all(10),            
            height: 50,
            width: 200,            
            child: TextField(
              autofocus: true,
              controller: addtextcontroller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter Item'                
              ),
            )),
            ElevatedButton(onPressed: (){
                
           Addtodo_List();
            }, child: Text('Add')),
            
            Expanded(
              
              child:               
              
              ListView.builder(
                padding: EdgeInsets.all(32),
                itemCount: Todo_List.length,
                itemBuilder: (BuildContext context,index){
                 return  ListTile(
                  leading: CircleAvatar(child: Text(Todo_List[index][0]),),
                  tileColor: Colors.grey,
                  title: Text(Todo_List[index]),
                  trailing: SizedBox(
                    width: 50,
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