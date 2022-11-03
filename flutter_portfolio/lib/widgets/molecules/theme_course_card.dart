import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/color.dart';
import 'package:flutter_portfolio/widgets/atoms/card.dart';
import 'package:flutter_portfolio/widgets/atoms/text.dart';
import 'package:flutter_portfolio/widgets/molecules/course_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ThemeCourseCard extends StatelessWidget {
  final ThemeCourseInfo theme;

  const ThemeCourseCard({super.key, required this.theme});

  Widget getIcon(LessonThemeInfo lesson) {
    if (lesson.finishLesson) {
      return const Icon(Icons.done, color: progressBarValueColor, size: 14);
    }

    return Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: theme.lessons[theme.getCurrentLesson()] == lesson
              ? progressBarValueColor
              : progressBarColor,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SizedBox(
                    height: 60,
                    child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircularStepProgressIndicator(
                            totalSteps: theme.getMaxLessons(),
                            currentStep: theme.getCurrentLesson(),
                            selectedColor: progressBarValueColor,
                            unselectedColor: progressBarColor,
                            padding: 0,
                            width: 40,
                            height: 40,
                            roundedCap: (_, __) => true,
                          ),
                          Container(
                            color: progressBarColor,
                            width: 2,
                            height: 20,
                          )
                        ])),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomText(
                      theme.title,
                      type: TypographyType.h3,
                    )),
                ...theme.lessons.map((lesson) {
                  return Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        SizedBox(
                            width: 40,
                            height: 60,
                            child: Wrap(
                                direction: Axis.vertical,
                                runAlignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  getIcon(lesson),
                                  if (theme
                                          .lessons[theme.getMaxLessons() - 1] !=
                                      lesson)
                                    Container(
                                      color: progressBarColor,
                                      width: 2,
                                      height: 40,
                                    )
                                ])),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            CustomText(
                              lesson.title,
                            ),
                            CustomText(
                              lesson.description,
                              type: TypographyType.labelSmall,
                            )
                          ],
                        )
                      ]);
                }).toList()
              ],
            )
          ])),
    );
  }
}
