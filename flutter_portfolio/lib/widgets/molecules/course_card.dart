import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/color.dart';
import 'package:flutter_portfolio/widgets/atoms/text.dart';

class LessonThemeInfo {
  String title;
  String description;
  bool finishLesson;

  LessonThemeInfo(this.title, this.description, this.finishLesson);
}

class ThemeCourseInfo {
  String title;
  bool? isStudying;
  List<LessonThemeInfo> lessons;

  int getCurrentLesson() {
    return lessons.where((lesson) => lesson.finishLesson).length;
  }

  int getMaxLessons() {
    return lessons.length;
  }

  ThemeCourseInfo(
    this.title,
    this.isStudying,
    this.lessons,
  );
}

class CourseInfo {
  String image;
  String title;
  int value;
  List<ThemeCourseInfo> themes;

  CourseInfo(this.image, this.title, this.value, this.themes);
}

class CourseCard extends StatefulWidget {
  final CourseInfo courseInfo;
  final int groupValue;
  final int index;
  final Function(int value, int index) onPressed;

  const CourseCard(
      {super.key,
      required this.courseInfo,
      required this.index,
      required this.groupValue,
      required this.onPressed});

  @override
  State<CourseCard> createState() => CourseCardState();
}

class CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.courseInfo.value == widget.groupValue;

    return GestureDetector(
        onTap: () {
          widget.onPressed(widget.courseInfo.value, widget.index);
        },
        child: AnimatedContainer(
          height: 140,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: isSelected
              ? (Matrix4.identity()..scale(1.02))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: shadowLight,
                  spreadRadius: isSelected ? 1 : 0,
                  blurRadius: isSelected ? 20 : 7)
            ],
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            SizedBox(
              width: 130,
              child: Column(children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.courseInfo.image)))),
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          CustomText(widget.courseInfo.title,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500))
                        ])),
              ]),
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastLinearToSlowEaseIn,
                bottom: isSelected ? -7 : 0,
                left: 55,
                height: isSelected ? 22 : 0,
                width: isSelected ? 22 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ))
          ]),
        ));
  }
}
