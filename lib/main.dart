import 'dart:io' show Platform; // Para verificar plataformas no web
import 'package:flutter/foundation.dart' show kIsWeb; // Verificar si es web
import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'models/question_model.dart';
import 'views/questions_view.dart';
import 'views/result_view.dart'; // Si tienes una pantalla de resultados

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Escala de Ansiedad',
  theme: ThemeData(primarySwatch: Colors.teal),
  initialRoute: '/',
  routes: {
    '/': (context) => HomeView(),
    '/questions': (context) => QuestionsView(questions: hamiltonQuestions),
    '/result': (context) => ResultView(answers: ModalRoute.of(context)?.settings.arguments as List<int>?), // Asegúrate de que se esté pasando correctamente los argumentos
  },
);
;
  }
}

class ResultViewWithPlatformSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int>? answers;

    if (kIsWeb) {
      // Si es web, obtenemos los parámetros desde la URL
      final uri = Uri.base;
      final answersParam = uri.queryParameters['answers'];

      if (answersParam != null && answersParam.isNotEmpty) {
        answers = answersParam.split(',')
            .map((s) => int.tryParse(s))
            .where((n) => n != null)
            .cast<int>()
            .toList();
      }
    } else {
      // En otras plataformas, usa arguments
      final arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments is List<int>) {
        answers = arguments;
      }
    }

    if (answers == null || answers.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Los argumentos pasados son inválidos o nulos.'),
        ),
      );
    }

    return ResultView(answers: answers);
  }
}
