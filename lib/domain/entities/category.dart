enum CategoryType { income, expense }

class Category {
  final int id;
  final String name;
  final CategoryType type;
  final String? description;
  final String? color;
  final String? icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.color,
    this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isIncome => type == CategoryType.income;
  bool get isExpense => type == CategoryType.expense;

  String get typeDisplayName {
    switch (type) {
      case CategoryType.income:
        return 'Income';
      case CategoryType.expense:
        return 'Expense';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.description == description &&
        other.color == color &&
        other.icon == icon &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        description.hashCode ^
        color.hashCode ^
        icon.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, type: $type, description: $description, color: $color, icon: $icon, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
