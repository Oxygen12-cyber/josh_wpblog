import 'package:flutter/material.dart';
import 'package:josh_wpblog/pages/homepage.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:josh_wpblog/pages/newspage.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NewsPage(
      //   imageUrl:
      //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq_ZUCVzfKJZ7J6PfhIDjoKqvJwTTDp7u_NQ&s",
      //   title: "Avatar: The last Airbender and the \nlast few things to do",
      //   content:
      //       "    random content in this place around 60 words to fill up the space in this application. Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender. Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.Embark on a globetrotting quest to fulfil Aang’s destiny with all your favorite characters and companions including Aang, Katara, Sokka, Toph, Suki and Zuko and the much-loved Appa and Momo in Avatar: Generations, an open-world RPG based on the animated hit Avatar the Last Airbender.",
      // ),
      home: HomePage(),
    );
  }
}
