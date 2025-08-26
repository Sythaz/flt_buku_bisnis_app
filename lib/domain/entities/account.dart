enum AccountType { cash, bank, creditCard, investment }

class Account {
  final int id;
  final String name;
  final AccountType type;
  final double balance;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Account({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isCash => type == AccountType.cash;
  bool get isBank => type == AccountType.bank;
  bool get isCreditCard => type == AccountType.creditCard;
  bool get isInvestment => type == AccountType.investment;

  String get typeDisplayName {
    switch (type) {
      case AccountType.cash:
        return 'Cash';
      case AccountType.bank:
        return 'Bank';
      case AccountType.creditCard:
        return 'Credit Card';
      case AccountType.investment:
        return 'Investment';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Account &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.balance == balance &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        balance.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'Account(id: $id, name: $name, type: $type, balance: $balance, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
