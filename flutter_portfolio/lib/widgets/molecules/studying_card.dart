import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/color.dart';
import 'package:flutter_portfolio/widgets/atoms/card.dart';
import 'package:flutter_portfolio/widgets/atoms/text.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StudyingInfo {
  String image;
  String title;
  String description;
  int maxLessons;
  int currentLesson;

  StudyingInfo(this.image, this.title, this.description, this.maxLessons,
      this.currentLesson);

  factory StudyingInfo.fromJson(Map<String, dynamic> json) {
    return StudyingInfo(
      json['image'],
      json['title'],
      json['description'],
      json['maxlessons'],
      json['currentlesson'],
    );
  }
}

class StudyingCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int maxLessons;
  final int currentLesson;

  const StudyingCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.maxLessons,
      required this.currentLesson});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: SizedBox(
      width: 250,
      child: Column(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image(fit: BoxFit.cover, image: NetworkImage(image)))),
        Container(
            padding: const EdgeInsets.all(16),
            height: 180,
            child: Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Wrap(direction: Axis.vertical, spacing: 20, children: [
                    CustomText(
                      title,
                      type: TypographyType.h3,
                    ),
                    CustomText(
                      description,
                      type: TypographyType.h2,
                    ),
                  ]),
                  Row(
                    children: [
                      CustomText(
                        '$currentLesson of $maxLessons lessons',
                        type: TypographyType.labelSmall,
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      SizedBox(
                          width: 36,
                          child: StepProgressIndicator(
                            totalSteps: maxLessons,
                            currentStep: currentLesson,
                            size: 8,
                            padding: 0,
                            selectedColor: progressBarValueColor,
                            unselectedColor: progressBarColor,
                            roundedEdges: const Radius.circular(10),
                          )),
                    ],
                  )
                ]))
      ]),
    ));
  }
}
