class HamiltonQuestion {
  final String question;
  final List<String> options;

  HamiltonQuestion({required this.question, required this.options});
}

// Lista de preguntas de la escala de Hamilton
final List<HamiltonQuestion> hamiltonQuestions = [
  HamiltonQuestion(
    question: '¿Se siente tenso(a) o en estado de alerta?',
    options: ['Nunca', 'Raramente', 'A veces', 'A menudo', 'Siempre'],
  ),
  HamiltonQuestion(
    question: '¿Tiene dificultad para relajarse?',
    options: ['Nunca', 'Raramente', 'A veces', 'A menudo', 'Siempre'],
  ),
  HamiltonQuestion(
    question: '¿Tiene dificultad para relajarse?',
    options: ['Nunca', 'Raramente', 'A veces', 'A menudo', 'Siempre'],
  ),
  

];
