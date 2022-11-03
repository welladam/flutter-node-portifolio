import 'package:flutter/material.dart';
import 'package:flutter_portfolio/interfaces/http.dart';
import 'package:flutter_portfolio/widgets/atoms/text.dart';
import 'package:flutter_portfolio/widgets/molecules/search_input.dart';
import 'package:flutter_portfolio/widgets/molecules/studying_card.dart';
import 'package:flutter_portfolio/widgets/organisms/studying_card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

handleButtonPress() {}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<StudyingInfo>> studyingList;

  @override
  void initState() {
    super.initState();
    studyingList = fetchStudies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 86),
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: Column(
              children: const [
                CustomText('Hi, Wellington',
                    type: TypographyType.h1, textAlign: TextAlign.center),
                SizedBox(height: 8),
                CustomText('What would you like to learn today? Search below.',
                    type: TypographyType.subtitle, textAlign: TextAlign.center),
              ],
            )),
        const Padding(
            padding: EdgeInsets.only(left: 26, right: 26),
            child: CustomInput(
              hintText: 'Search your course...',
              onButtonPressed: handleButtonPress,
            )),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.only(left: 26, right: 26, bottom: 8),
              child: CustomText('STUDYING',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          SizedBox(
              height: 300,
              child: FutureBuilder(
                  future: studyingList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return StudyingCardList(listCards: snapshot.data ?? []);
                    }
                    return const Center(child: Text("List is empty"));
                  }))
        ])
      ],
    ));
  }
}
