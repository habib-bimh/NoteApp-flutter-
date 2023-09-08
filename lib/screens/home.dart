import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  getRandomColor(){
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16,40,16,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notes",style: TextStyle(fontSize: 30,color: Colors.white),),
                IconButton(
                    onPressed: (){},
                    padding: EdgeInsets.all(0),
                    icon: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Icon(Icons.sort,color: Colors.white,)
                    )
                )
              ],
            ),
            SizedBox(height: 20),

            TextField(
              style: TextStyle(fontSize: 16,color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey ),
                hintText: "Search notes...",
                prefixIcon: Icon(Icons.search,color: Colors.grey),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent)
                ),

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.transparent)
                )
              ),

            ),
            Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 30),
                 itemCount: sampleNotes.length,
                  itemBuilder: (context,index){
                    return Card(
                      margin: EdgeInsets.only(bottom: 20),
                      color: getRandomColor(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: RichText(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: "${sampleNotes[index].title}\n",
                                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: "${sampleNotes[index].content}",
                                    style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),)
                                ]
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Edited ${DateFormat('EEE MMM d, yyy h:mm a').format(sampleNotes[index].modifiedTime)}",
                              style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic,color: Colors.grey.shade800),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    );
                  },

            ))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.add,size: 38,),
      ),
    );
  }
}
