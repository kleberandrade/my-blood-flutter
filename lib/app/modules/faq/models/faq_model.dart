import 'dart:convert';

class FaqModel {
  String question;
  String answer;

  FaqModel({
    this.question,
    this.answer,
  });

  FaqModel copyWith({
    String question,
    String answer,
  }) {
    return FaqModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }

  static FaqModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FaqModel(
      question: map['question'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  static FaqModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ChatbotModel(question: $question, answer: $answer)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FaqModel && o.question == question && o.answer == answer;
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode;
}
