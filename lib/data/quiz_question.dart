class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> ans = List.from(answers);
    ans.shuffle();
    return ans;
  }
}
