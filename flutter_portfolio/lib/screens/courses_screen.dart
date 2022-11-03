import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/theme.dart';
import 'package:flutter_portfolio/widgets/molecules/course_card.dart';
import 'package:flutter_portfolio/widgets/molecules/theme_course_card.dart';
import 'package:flutter_portfolio/widgets/organisms/course_card_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

List<CourseInfo> populateListMock() {
  List<CourseInfo> courseList = [];
  List<ThemeCourseInfo> themeCourseList = [];
  List<LessonThemeInfo> lessonThemeList = [];

  LessonThemeInfo topic1Theme =
      LessonThemeInfo('What is Art?', 'What does it Really mean?', true);
  lessonThemeList.add(topic1Theme);
  LessonThemeInfo topic2Theme = LessonThemeInfo(
      'Different Forms of Art', 'It is not just painting.', false);
  lessonThemeList.add(topic2Theme);
  LessonThemeInfo topic3Theme =
      LessonThemeInfo('Art Principles', 'Why are they important?', false);
  lessonThemeList.add(topic3Theme);

  ThemeCourseInfo theme =
      ThemeCourseInfo('Fundamentals of Art', true, lessonThemeList);
  ThemeCourseInfo theme2 =
      ThemeCourseInfo('Approaches to Art History', false, lessonThemeList);
  themeCourseList.add(theme);
  themeCourseList.add(theme2);

  courseList.add(CourseInfo(
      'https://cdn.dribbble.com/userupload/3346369/file/original-3cc338e4a3cdf7b5e3b9843dda74997f.png',
      'Course One',
      1,
      themeCourseList));
  courseList.add(CourseInfo(
      'https://cdn.dribbble.com/userupload/3346373/file/original-0e8b54bee194c0c2048e754622bc6a7c.png',
      'Course Two',
      2,
      themeCourseList));
  courseList.add(CourseInfo(
      'https://cdn.dribbble.com/userupload/3346369/file/original-3cc338e4a3cdf7b5e3b9843dda74997f.png',
      'Course Three',
      3,
      themeCourseList));
  courseList.add(CourseInfo(
      'https://cdn.dribbble.com/userupload/3346372/file/original-f1a48d4ecf2be1fec2a82e19a87dc271.png',
      'Course One',
      4,
      themeCourseList));
  return courseList;
}

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<CourseInfo> courseList = [];
  List<ThemeCourseInfo> themeList = [];

  @override
  void initState() {
    super.initState();
    courseList = populateListMock();
    themeList = courseList[0].themes;
  }

  handleCoursePress(List<ThemeCourseInfo> themes) {
    setState(() {
      themeList = themes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 26),
            height: 250,
            child: CourseCardList(
                listCards: courseList, onPressed: handleCoursePress)),
        Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                padding: const EdgeInsets.symmetric(horizontal: 26),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 26),
                itemCount: themeList.length,
                itemBuilder: (context, index) {
                  ThemeCourseInfo theme = themeList[index];
                  return ThemeCourseCard(theme: theme);
                }))
      ]),
    );
  }
}
