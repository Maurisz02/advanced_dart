import 'package:flutter/material.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

// enum Type { cat, dog }

abstract class CanRun {
/*   final Type type;

  const CanRun({
    required this.type,
  }); */

  /*  String get type {
    if (this is Cat) {
      return 'Cat';
    } else {
      return 'Something else';
    }
  } */

  /*  @mustCallSuper
  void run() {
    "CanRun run function is called".log();
  } */

  void run() {
    "Runing...".log();
  }
}

abstract class CanWalk {
  void walk() {
    'Walking...'.log();
  }
}

// u can extend one object and with can be ultiple Object
// abstract = empty / not logical
// super is a reference to the class what you extend from
//mixins are simpl classes
//if yourabstract class hace constructor it no longer a mixin

/* class Cat extends CanRun {
  // const Cat() : super(type: Type.cat);

  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
} */

class Cat with CanRun, CanWalk {}

/* class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
} */

void testIt() {
  /* const cat = Cat();
  cat.type.log();
  const dog = Dog();
  dog.type.log(); */

  final cat = Cat();
  /* cat.run();
  cat.walk(); */
  cat
    ..run()
    ..walk();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
