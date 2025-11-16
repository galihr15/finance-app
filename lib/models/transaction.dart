class Transaction {
  final String id;
  final String name;
  final String description;
  final String amount;
  final String time;
  final bool isExpense;

  Transaction({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.time,
    required this.isExpense,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'time': time,
      'isExpense': isExpense,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      amount: map['amount'],
      time: map['time'],
      isExpense: map['isExpense'],
    );
  }
}