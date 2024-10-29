import 'package:eos_todolist/widgets/add_button.dart';
import 'package:eos_todolist/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toDoLists.add("111111");
    toDoLists.add("222222");
    toDoLists.add("333333");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
          title: Text('EOS ToDoList'),
          leading: Image.asset('assets/images/eos_logo.png'),
        ),
        body: Column(
          children: [
            Container(
                height: 200,
                padding: EdgeInsets.all(25),
                child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 10,
                            color: Colors.grey,

                          ),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Center(
                            child: Image.asset('assets/images/eos_logo.png')),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Expanded(               //Expanded가 없으면 widget에서 바꾸기
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '최현준',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('종강하고 싶어요.'),
                          ],
                        ),
                      )
                    ])),
            Stack(
              children: [
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 25),
                   child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height - 300,
                   decoration: BoxDecoration(
                      color: Color(0xFFA4C639).withOpacity(0.1),
                     borderRadius: BorderRadius.circular(20),
                   ),
                 ),),
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width * 0.5 - 75,
                  child: Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Color(0xFFA4C639).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "To do list",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 40, right:25),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 400,
                    child: ListView.builder(
                      itemCount: toDoLists.length,
                        itemBuilder: (BuildContext context, int index){
                          return ToDoItem(
                            title: toDoLists[index],
                            onDelete: () {
                              setState(() {
                                toDoLists.removeAt(index);
                              });
                            },
                          );
                        }
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                    right: 50,
                    child: AddButton(
                      onPressed: () {
                        setState(() {
                          toDoLists.add("+++++++++");
                        });
                      },
                    )
                )
              ],
            )
          ],
        ));;
  }
}
