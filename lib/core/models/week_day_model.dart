class WeekDayModel {
  final int index;
  final String label;
  final DateTime date;
  final bool isSelected;

  WeekDayModel({
    required this.index,
    required this.label,
    required this.date,
    this.isSelected = false,
  });

  WeekDayModel copyWith({int? index, String? label, DateTime? date, bool? isSelected}) {
    return WeekDayModel(
      index: index ?? this.index,
      label: label ?? this.label,
      date: date ?? this.date,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
