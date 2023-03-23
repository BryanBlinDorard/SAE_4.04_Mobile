class Category {
  int id;
  String name;

  Category({required this.id, required this.name});

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }

  toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}