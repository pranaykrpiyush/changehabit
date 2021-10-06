import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:habbittracker/select_habit_screen.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: IntroductionScreen(
          onSkip: () {
            Get.off(() => SelectHabitScreen());
          },
          skip: Text("Skip"),
          showSkipButton: true,
          onDone: () {
            Get.off(() => SelectHabitScreen());
          },
          done: Text('Get Started'),
          showDoneButton: true,
          //  showSkipButton: true,
          showNextButton: true,
          nextFlex: 1,
          next: Text('Next'),
          pages: [
            PageViewModel(
              titleWidget: Text(
                "Take Control of Your Habits",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              image: Image.asset('images/onboarding1.jpg'),
              bodyWidget: Text(
                "Your life doesn't get better by chance, it gets better by change",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Change in bad habits, changes life",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              image: Image.asset('images/onboarding2.jpg'),
              bodyWidget: Text(
                "Simply add your goal and track to magic",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Track & Achieve Your Dreams",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              image: Image.asset('images/onboarding3.jpg'),
              bodyWidget: Text(
                "Success doesn't come in day, it takes time to reap fruits",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            )
          ],
        )),
      ),
    );
  }
}
//
// class PageCard extends StatelessWidget {
//   final PageData page;
//
//   const PageCard({
//     Key? key,
//     required this.page,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 30.0,
//       ),
//       child: Column(
// //        mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _buildPicture(context),
//           SizedBox(height: 30),
//           _buildText(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildText(BuildContext context) {
//     return Text(
//       page.title!,
//       style: Theme.of(context).textTheme.headline6,
//       textAlign: TextAlign.center,
//     );
//   }
//
//   Widget _buildPicture(
//     BuildContext context, {
//     double size = 190,
//     double iconSize = 170,
//   }) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(60.0)),
//         color: page.bgColor
// //            .withBlue(page.bgColor.blue - 40)
//             .withGreen(page.bgColor.green + 20)
//             .withRed(page.bgColor.red - 100)
//             .withAlpha(90),
//       ),
//       margin: EdgeInsets.only(
//         top: 140,
//       ),
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Positioned.fill(
//             child: RotatedBox(
//               quarterTurns: 2,
//               child: Icon(
//                 page.icon,
//                 size: iconSize + 20,
//                 color: page.bgColor
//                     .withBlue(page.bgColor.blue - 10)
//                     .withGreen(220),
//               ),
//             ),
//             right: -5,
//             bottom: -5,
//           ),
//           Positioned.fill(
//             child: RotatedBox(
//               quarterTurns: 5,
//               child: Icon(
//                 page.icon,
//                 size: iconSize + 20,
//                 color: page.bgColor.withGreen(66).withRed(77),
//               ),
//             ),
//           ),
//           Icon(
//             page.icon,
//             size: iconSize,
//             color: page.bgColor.withRed(111).withGreen(220),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
//
//
//
// PageModel.withChild(
// child: Container(
// child: Column(
// children: [
// Image.asset('images/onboarding1.jpg'),
// SizedBox(
// height: 40,
// ),
// Text(
// 'Take Control of Your Habits',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.w600,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 40.0),
// child: Text(
// "Your life doesn't get better by chance, it gets better by change",
// style:
// TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// textAlign: TextAlign.center,
// ),
// )
// ],
// ),
// ),
// color: Colors.white,
// // imageAssetPath: 'images/onboarding1.jpg',
// // title: 'Screen 1',
// // body: 'Share your ideas with the team',
// ),
// PageModel.withChild(
// child: Container(
// child: Column(
// children: [
// Image.asset('images/onboarding2.jpg'),
// SizedBox(
// height: 40,
// ),
// Text(
// 'Change in bad habits, changes life',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.w600,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 40.0),
// child: Text(
// "Simply sign up and add your task and see magic",
// style:
// TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// textAlign: TextAlign.center,
// ),
// )
// ],
// ),
// ),
// color: Colors.white,
// // imageAssetPath: 'images/onboarding1.jpg',
// // title: 'Screen 1',
// // body: 'Share your ideas with the team',
// ),
// PageModel.withChild(
// child: Container(
// child: Column(
// children: [
// Image.asset('images/onboarding3.jpg'),
// SizedBox(
// height: 40,
// ),
// Text(
// 'Track & Achieve Dreams',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.w600,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 40.0),
// child: Text(
// "Success does not come in a day, it takes time to recap fruits of change",
// style:
// TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// textAlign: TextAlign.center,
// ),
// )
// ],
// ),
// ),
// color: Colors.white,
// // imageAssetPath: 'images/onboarding1.jpg',
// // title: 'Screen 1',
// // body: 'Share your ideas with the team',
// ),
