import 'package:flutter/material.dart';

import 'dart:developer' as devtools show log;
import 'dart:io';
import 'package:meta/meta.dart';
import 'dart:convert';

extension Log on Object {
  void log() => devtools.log(toString());
}

/* abstract class Animal {
  const Animal();
}

// CanRun only be a mixin to those classes who extend on Animal
mixin CanRun on Animal {
  int get speed;

  void run() {
    "Running at the speed of $speed".log();
  }
}

class Cat extends Animal with CanRun {
  // its a getter and a setter now after override
  @override
  int speed = 10;
}

class Dog with CanRun {
  @override
  int get speed => throw UnimplementedError();
}

void testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 20;
  cat.run();
} */

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(
        Uri.parse(url),
      )
      .then(
        (req) => req.close(),
      );
}

mixin CanMakeGetCall {
  String get url;

  @useResult
  Future<String> getString() => getUrl(
        url,
      ).then(
        (resp) => resp.transform(utf8.decoder).join(),
      );
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();

  @override
  String get url => 'http://127.0.0.1:5500/apis/people.json';
  // replace the url with the local ipv4 url and it will be fine
}

void testIt() async {
  final people = await const GetPeople().getString();
  people.log();
}

class Mixins extends StatelessWidget {
  const Mixins({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return Container();
  }
}
