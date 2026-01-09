class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime? createdAt;

  Task({required this.id, required this.title, required this.isCompleted, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      isCompleted: json['is_completed'] as bool? ?? false,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'is_completed': isCompleted, 'created_at': createdAt?.toIso8601String()};
  }

  Task copyWith({String? id, String? title, bool? isCompleted, DateTime? createdAt}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.isCompleted == isCompleted &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(id, title, isCompleted, createdAt);
  }
}
