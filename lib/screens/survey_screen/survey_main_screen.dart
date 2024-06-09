import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class SurveyMainScreen extends StatefulWidget {
  const SurveyMainScreen({super.key});

  @override
  _SurveyMainScreenState createState() => _SurveyMainScreenState();
}

class _SurveyMainScreenState extends State<SurveyMainScreen> {
  int _currentQuestionIndex = 0;
  List<String> _selectedOptions = [];
  TextEditingController _otherController = TextEditingController();
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }
  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }
  void _nextQuestion() {
    if (_currentQuestionIndex < _buildQuestions().length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      print("Selected Options: $_selectedOptions");
      print("Other: ${_otherController.text}");
      Navigator.pop(context);
    }
  }

  void _toggleOption(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  Widget _buildOption(String option) {
    return GestureDetector(
      onTap: () => _toggleOption(option),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: _selectedOptions.contains(option)
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Text(
          option,
          style: TextStyle(
            color: _selectedOptions.contains(option)
                ? Colors.white
                : Theme.of(context).primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildQuestions() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "1. Какие курсы вас интересуют больше всего?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Веб-разработка"),
          _buildOption("Мобильная разработка"),
          _buildOption("Машинное обучение и ИИ"),
          _buildOption("Кибербезопасность"),
          _buildOption("Анализ данных и Big Data"),
          _buildOption("Сетевое администрирование"),
          _buildOption("Базы данных"),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Другое (пожалуйста, уточните):",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _otherController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "2. Какой у вас уровень опыта в IT?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Начинающий (0-1 год опыта)"),
          _buildOption("Средний (1-3 года опыта)"),
          _buildOption("Продвинутый (более 3 лет опыта)"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "3. Какие форматы обучения вы предпочитаете?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Видеоуроки"),
          _buildOption("Интерактивные курсы"),
          _buildOption("Вебинары и онлайн-лекции"),
          _buildOption("Текстовые материалы и книги"),
          _buildOption("Практические проекты"),
          _buildOption("Форумы и группы для обсуждения"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "4. Как часто вы готовы заниматься обучением?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Ежедневно"),
          _buildOption("Несколько раз в неделю"),
          _buildOption("Раз в неделю"),
          _buildOption("Несколько раз в месяц"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "5. Какие временные интервалы для вас наиболее удобны для занятий?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Утро (6:00 - 12:00)"),
          _buildOption("День (12:00 - 18:00)"),
          _buildOption("Вечер (18:00 - 22:00)"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "6. Какие функции или особенности приложения вы считаете наиболее полезными?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Личные кабинеты и профиль достижений"),
          _buildOption("Система тестов и экзаменов"),
          _buildOption("Сертификаты по окончании курсов"),
          _buildOption("Поддержка наставников и менторов"),
          _buildOption("Общение и сети с другими студентами"),
          _buildOption("Доступ к актуальным новостям и статьям в IT"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "7. Как вы узнали о нашем приложении?",
            style: TextStyle(fontSize: 18),
          ),
          _buildOption("Рекомендация друзей или коллег"),
          _buildOption("Поиск в интернете"),
          _buildOption("Социальные сети"),
          _buildOption("Реклама"),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Другое (пожалуйста, уточните):",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _otherController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed:() {
              _controllerCenter.play();
              _nextQuestion();
            }, 
            child: const Text("Далее", textAlign: TextAlign.center,),
          ),
        ],
      ),
      Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
            ], 
          ),
        ),
          const Text(
            "Спасибо за участие в опросе! \n  Ваши ответы будут учтены",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text("Завершить", textAlign: TextAlign.center,
            
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Опрос",), leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildQuestions()[_currentQuestionIndex],
            ),
          
        ),
      ),
    );
  }
}
