import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/molecules/studying_card.dart';

class StudyingCardList extends StatelessWidget {
  final List<StudyingInfo> listCards;

  const StudyingCardList({
    super.key,
    required this.listCards,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 26),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: 26),
        itemCount: listCards.length,
        itemBuilder: (context, index) {
          final card = listCards[index];
          return StudyingCard(
            image: card.image,
            title: card.title,
            description: card.description,
            currentLesson: card.currentLesson,
            maxLessons: card.maxLessons,
          );
        });
  }
}
