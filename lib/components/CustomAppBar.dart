// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({super.key});

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: PreferredSize(
//           preferredSize: Size.fromHeight(220),
//           child: Container(
//             padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
//             color: Color.fromARGB(255, 173, 223, 211),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               // TITLE
//               Text('KA-CHING!',
//                   style: TextStyle(
//                       fontSize: 40.0,
//                       color: Colors.white,
//                       fontFamily: 'Jua',
//                       fontWeight: FontWeight.bold)),

//               // APPBAR
//               Container(
//                   height: 90.0,
//                   width: 500.0,
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 230, 132, 91),
//                       borderRadius: BorderRadius.circular(20.0)),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.all(15),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(Icons.monetization_on_rounded,
//                                           size: 25.0, color: Colors.white),
//                                       Text(
//                                         "Balance",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     "300",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.all(15),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(Icons.credit_card,
//                                           size: 25.0, color: Colors.white),
//                                       Text(
//                                         "Income",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     "300",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.all(15),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(Icons.money_off_rounded,
//                                           size: 25.0, color: Colors.white),
//                                       Text(
//                                         "Expense",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     "300",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                       ])),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
