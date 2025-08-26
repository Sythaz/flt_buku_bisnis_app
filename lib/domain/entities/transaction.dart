enum TransactionType { income, expense, transfer }

class Transaction {
  final int id;
  final TransactionType type;
  final double amount;
  final String description;
  final int accountId;
  final int categoryId;
  final int? toAccountId; // For transfers
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.accountId,
    required this.categoryId,
    this.toAccountId,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isIncome => type == TransactionType.income;
  bool get isExpense => type == TransactionType.expense;
  bool get isTransfer => type == TransactionType.transfer;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Transaction &&
        other.id == id &&
        other.type == type &&
        other.amount == amount &&
        other.description == description &&
        other.accountId == accountId &&
        other.categoryId == categoryId &&
        other.toAccountId == toAccountId &&
        other.date == date &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        amount.hashCode ^
        description.hashCode ^
        accountId.hashCode ^
        categoryId.hashCode ^
        toAccountId.hashCode ^
        date.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'Transaction(id: $id, type: $type, amount: $amount, description: $description, accountId: $accountId, categoryId: $categoryId, toAccountId: $toAccountId, date: $date, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
