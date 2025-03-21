import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

void main(){
  runApp(routing());
}

class routing extends StatelessWidget {
  const routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "KA-CHING", 
      home:const homePage(), 
      routes: {
        'addExpense': (BuildContext ctx) => const addExpense(),
      } 
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key:key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("KA-CHING!",), backgroundColor: Color.fromARGB(255, 173, 223, 211), ),
    body: Material(child:Center(child: Text("Today's Expense"),)),
    bottomNavigationBar: Padding(padding: const EdgeInsets.all(20),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: BottomAppBar(color: Color.fromARGB(255, 173, 223, 211),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('addExpense');
          }, icon: Icon(Icons.price_change_sharp),  iconSize: 40.0,),
          IconButton(onPressed: (){}, icon: Icon(Icons.home), iconSize: 40.0,),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings), iconSize: 40.0,),
        ],
      )
    ),
    )));
  }
}

class addExpense extends StatefulWidget {
  const addExpense({Key? key}) : super(key: key);

  @override
  State<addExpense> createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KA-CHING!"),backgroundColor: Color.fromARGB(255, 173, 223, 211), ), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE6845B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('INCOME', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField('Date', _dateController, Icons.calendar_today),
              _buildTextField('Amount', _amountController, null),
              _buildTextField('Expense Title', _titleController, null),
              _buildTextField('Enter Message', _messageController, null,
                  maxLines: 3),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process form data
                      print('Date: ${_dateController.text}');
                      print('Amount: ${_amountController.text}');
                      print('Expense Title: ${_titleController.text}');
                      print('Message: ${_messageController.text}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE6845B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('SAVE', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData? icon,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color(0xFFFBFFE4),
          suffixIcon:
              icon != null ? Icon(icon, color: Color(0xFFE6845B)) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}