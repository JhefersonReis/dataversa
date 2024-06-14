import 'package:isar/isar.dart';

part 'answer_model.g.dart';

@collection
class Answer {
  Id id;
  int responseId;
  int questionId;
  String value;
  String? other;

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      id: map['id'] as Id,
      responseId: map['response_id'] as int,
      questionId: map['question_id'] as int,
      value: map['value'] as String,
      other: map['other'] as String,
    );
  }

  Answer({
    required this.id,
    required this.responseId,
    required this.questionId,
    required this.value,
    this.other,
  });
}
