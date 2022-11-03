import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/molecules/course_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CourseCardList extends StatefulWidget {
  final List<CourseInfo> listCards;
  final Function(List<ThemeCourseInfo> themes) onPressed;

  const CourseCardList(
      {super.key, required this.listCards, required this.onPressed});

  @override
  State<CourseCardList> createState() => CourseCardListState();
}

class CourseCardListState extends State<CourseCardList> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int groupValue = 1;

  handleCardPress(int value, int index) {
    setState(() => groupValue = value);
    itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
    widget.onPressed(widget.listCards[index].themes);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      padding: const EdgeInsets.all(26),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.listCards.length,
      itemBuilder: (context, index) => Row(children: [
        CourseCard(
            index: index,
            courseInfo: widget.listCards[index],
            groupValue: groupValue,
            onPressed: handleCardPress),
        const SizedBox(
          width: 16,
        )
      ]),
      itemScrollController: itemScrollController,
    );
  }
}
