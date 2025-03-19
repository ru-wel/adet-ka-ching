import 'package:flutter/material.dart';

// import '../components/CustomAppBar.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // appBar: AppBar(
        //   title: Text(
        //     "KA-CHING!",
        //   ),
        //   backgroundColor: Color.fromARGB(255, 173, 223, 211),
        // ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(220),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
              color: Color.fromARGB(255, 173, 223, 211),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TITLE
                    Text('KA-CHING!',
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontFamily: 'Jua',
                            fontWeight: FontWeight.bold)),

                    // APPBAR
                    Container(
                        height: 90.0,
                        width: 500.0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 132, 91),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.monetization_on_rounded,
                                                size: 25.0,
                                                color: Colors.white),
                                            Text(
                                              "Balance",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "300",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.credit_card,
                                                size: 25.0,
                                                color: Colors.white),
                                            Text(
                                              "Income",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "300",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.money_off_rounded,
                                                size: 25.0,
                                                color: Colors.white),
                                            Text(
                                              "Expense",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "300",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ])),
                  ]),
            ),
          ),
          body: Material(
          child: Center(
            child: Text("Today's Expense"),
          )),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: BottomAppBar(
                  color: Color.fromARGB(255, 173, 223, 211),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('addExpense');
                        },
                        icon: Icon(Icons.price_change_sharp),
                        iconSize: 40.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home),
                        iconSize: 40.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        iconSize: 40.0,
                      ),
                    ],
                  )),
            )))
        );
  }
}
