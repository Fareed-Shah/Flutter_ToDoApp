import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

final _formkey = GlobalKey<FormState>();

  List<String> Todo_List = ['Fareed','Shah'];     
  TextEditingController addtextcontroller =TextEditingController();
  TextEditingController  updatetodolist =TextEditingController();



  Addtodo_List(){    
    setState(() {      
    Todo_List.add(addtextcontroller.text);
    addtextcontroller.clear();
   }) ;        
  }

  deleteitem(index){
   setState(() {      
   Todo_List.removeAt(index);                                          
    }) ;

  }

  Cleartodo_List(){
    setState(() {
    Todo_List.clear();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(onPressed: (){                    
                Addtodo_List();
                }, child: Text('Add')),                
                ElevatedButton(onPressed: (){
                  Cleartodo_List();
                },
                 child: Text('Clear')),                 
              ],
            ),
            
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
                  trailing: 
                  SizedBox(width: 100,
                    child: Row(
                      children: [
                        IconButton(
                        iconSize: 30.0,tooltip: 'Delete',
                        onPressed: (){
                        deleteitem(index);                         
                        },
                        icon: Icon(Icons.delete,color: Colors.red,)),                        
                        IconButton(iconSize: 30.0,tooltip: 'Edit',
                        onPressed: (){
                        showDialog(
                          context: context,
                           builder: (context)
                           {
                            return AlertDialog(
                              title: Text('Update To Do List'),
                              
                              content:
                              
                              //  TextField(                                                                
                              //   autofocus: true,                                
                              //   decoration: InputDecoration(
                              //   errorText: _error ? 'Please Add To Do List' : null ,
                              //   ),
                              //   controller:  updatetodolist,                                
                              // ),
                              Form(
                                key: _formkey,
                                child: 
                                TextFormField(     
                                  controller:  updatetodolist,                              
                                validator: (value){                                  
                                  if(value!.isEmpty)                                     
                                  return 'Please Enter ToDo-List';
                                  return null;                                                                    
                                },
                              )
                              
                              ),
                           
                              actions: [
                                ElevatedButton(onPressed: (){

                                if(_formkey.currentState!.validate())
                                {

                                
                               

                                   Navigator.of(context).pop();                                                                                                            
                                          setState(
                                            () {                                                                                          
                                              Todo_List.replaceRange(
                                                index,
                                                index + 1,
                                                {updatetodolist.text},
                                              );
                                               updatetodolist.clear();
                                              } 
                                            
                                          ); 

                                }}
                                

                                , child: Text('Ok'))
                              ],
                            );
                           }
                           );

                        }, icon: Icon(Icons.edit,color: Colors.lightBlue))
                       
                      ],
                    ),
                  )
                  

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



