import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class Expense {
  final int? id;
  final String title;
  final double amount;
  final DateTime date;
  final int categoryId;
  final bool isExpense; // true for expense, false for income

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.categoryId,
    this.isExpense = true,
  });

  // Convert Expense object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'categoryId': categoryId,
      'isExpense': isExpense ? 1 : 0,
    };
  }

  // Create Expense object from Map
  static Expense fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'].toDouble(),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      categoryId: map['categoryId'],
      isExpense: map['isExpense'] == 1,
    );
  }

  // Format date for display
  String get formattedDate => DateFormat('yyyy-MM-dd').format(date);
  
  // Format amount for display
  String get formattedAmount => NumberFormat.currency(symbol: '¥').format(amount);
}
    
