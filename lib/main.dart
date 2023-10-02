import 'package:flutter/material.dart';

void main() {
  runApp(const AppStore());
}

class AppStore extends StatelessWidget {
  const AppStore({super.key});

  // Главный экран.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главный экран',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 235, 235),
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Color.fromARGB(255, 7, 7, 6),
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        useMaterial3: true,
      ),
      routes: {
        //роутинг по страницам категорий товаргов
        '/': (context) => const MyHomePage(title: 'Категории товаров'),
        '/prodCat': (context) => ProdCatScreen(),
      },
    );
  }
}

//категории товаров
final List<String> prodCat = [
  "Беседки для дачи",
  "Зоны отдыха",
  "Навесы для машины",
  "Торговые павильоны",
  "Барбекю"
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Аппбар главного экрана
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount:
              prodCat.length, //передаем в ListView.builder количество категорий
          itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(prodCat[index], style: TextStyle(fontSize: 24)),
                onTap: () {
                  //действие по нажатию на категорию
                  Navigator.of(context).pushNamed(
                    '/prodCat',
                    arguments: prodCat[
                        index], // аргумент для передачи имени категории на следующий экран.
                  );
                },
              )),
    );
  }
}

// Отображение экрана при переходе на каждую категорию
class ProdCatScreen extends StatefulWidget {
  const ProdCatScreen({super.key});

  @override
  State<ProdCatScreen> createState() => _ProdCatScreenState();
}

class _ProdCatScreenState extends State<ProdCatScreen> {
  String prodCatName = '';

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    prodCatName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Аппбар главного экрана
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(prodCatName),
        // title: Text(prodCat[index], style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
