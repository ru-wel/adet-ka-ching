// https://medium.com/@deepak.devflutter/model-class-in-flutter-for-beginners-924317c56a17
// https://stackoverflow.com/questions/74406194/i-want-to-add-items-inside-an-array

class Expense {
  final int? id;
  final String title;
  final int amount;
  final String date;
  final String message;
  final String type;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.message = ''
  }) : type = "expense" ;

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
      'message': message,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: map['date'],
      message: map['message'] ?? '',
    );
  }
}

