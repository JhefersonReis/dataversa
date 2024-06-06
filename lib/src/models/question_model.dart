import 'package:isar/isar.dart';

part 'question_model.g.dart';

@collection
class Question {
  Id id;
  String question;
  String? help;
  int qid;
  int parentQid;
  int sid;
  String type;
  String title;
  String other;
  String? mandatory;
  int questionOrder;
  String questionThemeName;
  int gid;

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as Id,
      question: map['question'] as String,
      help: map['help'] as String?,
      qid: map['qid'] as int,
      parentQid: map['parent_qid'] as int,
      sid: map['sid'] as int,
      type: map['type'] as String,
      title: map['title'] as String,
      other: map['other'] as String,
      mandatory: map['mandatory'] as String?,
      questionOrder: map['question_order'] as int,
      questionThemeName: map['question_theme_name'] as String,
      gid: map['gid'] as int,
    );
  }

  Question({
    required this.id,
    required this.question,
    required this.help,
    required this.qid,
    required this.parentQid,
    required this.sid,
    required this.type,
    required this.title,
    required this.other,
    required this.mandatory,
    required this.questionOrder,
    required this.questionThemeName,
    required this.gid,
  });
}
