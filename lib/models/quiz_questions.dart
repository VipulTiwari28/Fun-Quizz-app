class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  //function to shuffle the list and not changing the original list of answers
  List<String> shuffledList() {
    final List<String> shuffledlists = List.of(answers);
    shuffledlists.shuffle();
    return shuffledlists;
  }
}
