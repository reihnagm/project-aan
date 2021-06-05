import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiple Choice Quiz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List value = [];
  bool isloading = false;
  
  List<Map<dynamic, dynamic>> questions = [
    {
      0: {
        "question": "1 + 1 ?",
        "answers":[
          {
            "id": 01,
            "sign": 1,
            "title": "A. 2",
            "isanswer": true,
          },
          {
            "id": 02,
            "sign": 1,
            "title": "B. 3",
            "isanswer": false,
          },
          {
            "id": 03,
            "sign": 1,
            "title": "C. 5",
            "isanswer": false
          }
        ]
      },
    }, 
    {
      1: {
        "question": "Choose element tag for link...",
        "answers":[
          {
            "id": 11,
            "sign": 2,
            "title": "A. div",
            "isanswer": false
          },
          {
            "id": 12,
            "sign": 2,
            "title": "B. a=href",
            "isanswer": true
          },
          {
            "id": 13,
            "sign": 2,
            "title": "C. p",
            "isanswer": false
          } 
        ]
      }
    },
    {
      2: {
        "question": "Windows 10 release ?",
        "answers":[
          {
            "title": "A. 2015",
            "sign": 3,
            "isanswer": true,
          },
          {
            "title": "B. 2012",
            "sign": 3,
            "isanswer": false,
          },
          {
            "title": "C. 2009",
            "sign": 3,
            "isanswer": false,
          }
        ]
      }
    },
    {
      3: {
        "question": "Youtube release ?",
        "answers":[
          {
            "title": "A. 2003",
            "sign": 4,
            "isanswer": false, 
          },
          {
            "title": "B. 2005",
             "sign": 4,
            "isanswer": true,
          },
          {
            "title": "C. 2004",
            "sign": 4,
            "isanswer": false,
          }
        ]
      }
    },
    {
      4: {
        "question": "Facebook release ?",
        "answers":[
          {
            "title": "A. 1998",
            "sign": 5,
            "isanswer": false, 
          },
          {
            "title": "B. 2000",
            "sign": 5,
            "isanswer": false,
          },
          {
            "title": "C. 2004",
            "sign": 5,
            "isanswer": true,
          }
        ]
      }
    },
    {
      5: {
        "question": "Amazon release ?",
        "answers":[
          {
            "title": "A. 1998",
            "sign": 6,
            "isanswer": false, 
          },
          {
            "title": "B. 2000",
            "sign": 6,
            "isanswer": false,
          },
          {
            "title": "C. 1994",
            "sign": 6,
            "isanswer": true,
          }
        ]
      }
    },
    {
      6: {
        "question": "Android release ?",
        "answers":[
          {
            "title": "A. 2008",
            "sign": 7,
            "isanswer": true, 
          },
          {
            "title": "B. 2009",
            "sign": 7,
            "isanswer": false,
          },
          {
            "title": "C. 2000",
            "sign": 7,
            "isanswer": false,
          }
        ]
      }
    },
    {
      7: {
        "question": "Instagram release ?",
        "answers":[
          {
            "title": "A. 10 Oktober 2010",
            "sign": 8,
            "isanswer": true, 
          },
          {
            "title": "B. 11 Oktober 2008",
            "sign": 8,
            "isanswer": false,
          },
          {
            "title": "C. 24 Oktober 2009",
            "sign": 8,
            "isanswer": false,
          }
        ]
      }
    },
    {
      8: {
        "question": "Java release ?",
        "answers":[
          {
            "title": "A. 1995",
            "sign": 9,
            "isanswer": true, 
          },
          {
            "title": "B. 2000",
            "sign": 9,
            "isanswer": false,
          },
          {
            "title": "C. 1990",
            "sign": 9,
            "isanswer": false,
          }
        ]
      }
    },
    {
      9: {
        "question": "Who is founder of Facebook ?",
        "answers":[
          {
            "title": "A. Mark Zuckerberg",
            "sign": 10,
            "isanswer": true, 
          },
          {
            "title": "B. Elliot Yamin",
            "sign": 10,
            "isanswer": false,
          },
          {
            "title": "C. Bill Gates",
            "sign": 10,
            "isanswer": false,
          }
        ]
      }
    },
  ];
  
  List<Map<String, dynamic>> answered = [];

  @override
  void initState() {
    super.initState();
    isloading = true;    
    Future.delayed(Duration.zero, () {
      for (int i = 0; i < questions.length; i++) {
        setState(() {
          value.add(null);
        }); 
      }
    });
    isloading = false;
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose the correct answer by fill circle",
          style: TextStyle(
            fontSize: 17.0
          ),
        ),
      ),
      body: ListView(
        children: [
          isloading 
          ? Container()
          : ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int i) { 
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: .8,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${i + 1}. ${questions[i][i]["question"].toString()}"),
                        SizedBox(height: 8.0),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: questions[i][i]["answers"].length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int z) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RadioListTile(
                                  value: int.parse("$i$z"),
                                  groupValue: value[i],
                                  controlAffinity: ListTileControlAffinity.leading,
                                  onChanged: (index) {
                                    setState(() => value[i]= index);   
                                                         
                                    answered.add({
                                      "id": questions[i][i]["answers"][z]["id"], 
                                      "sign": questions[i][i]["answers"][z]["sign"],
                                      "answered": questions[i][i]["answers"][z]["isanswer"]
                                    });     

                                    // print(answered.where((el) => Set().add(el["sign"])).toList());
                                  },  
                                  title: Text(questions[i][i]["answers"][z]["title"],
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },  
          ),

          Container(
            margin: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                // groupBy(answered, (obj) => obj['sign']);
                Map<dynamic, dynamic> mp = {};
                for (var item in answered) {
                  mp[item["sign"]] = item;
                }
                var filteredList = mp.values.toList();
                int falseAnswer = filteredList.where((el) => el["answered"] == false).toSet().length;
                int trueAnswer = filteredList.where((el) => el["answered"] == true).length;
                String point = (filteredList.where((el) => el["answered"] == true).length / questions.length * 100).toStringAsFixed(0);
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Container(
                      height: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(int.parse(point) < 70)
                            Container(
                              child: Text("YOU FAIL!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red
                                ),
                              ),
                            ),
                          if(int.parse(point) >= 70)
                            Container(
                              child: Text("YOU PASSED!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.green
                                ),
                              ),
                            ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Score : "),
                              ),
                              Container(
                                child: Text(point)
                              )
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Correct Answer : ",
                                  style: TextStyle(
                                    color: Colors.green
                                  ), 
                                ),
                              ),
                              Container(
                                child: Text(trueAnswer.toString())
                              )
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Wrong Answer : ",
                                  style: TextStyle(
                                    color: Colors.red
                                  ), 
                                ),
                              ),
                              Container(
                                child: Text(falseAnswer.toString())
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  } 
                );
              },
              child: Text("Submit Your Answer"),  
            ),
          ),
          
        ],
      ),
    );
  }
}
