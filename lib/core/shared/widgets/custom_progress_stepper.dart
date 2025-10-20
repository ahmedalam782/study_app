// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../../theme/app_colors.dart';

// class CustomProgressStepper extends StatelessWidget {
//   const CustomProgressStepper({super.key, required this.currentStep});
//   final int currentStep;
//   @override
//   Widget build(BuildContext context) {
//     bool isEnglish = context.locale.languageCode == 'en';
//     return Stack(
//       children: [
//         Container(
//           height: 2,
//           decoration: BoxDecoration(
//             color: AppColors.grayDB,
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         TweenAnimationBuilder<double>(
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//           tween: Tween<double>(
//             begin: 0,
//             end: currentStep / 4,
//           ),
//           builder: (context, value, child) {
//             return LayoutBuilder(
//               builder: (context, constraints) {
//                 return Stack(
//                   children: [
//                     LinearProgressIndicator(
//                       value: value,
//                       backgroundColor: Colors.transparent,
//                       valueColor: const AlwaysStoppedAnimation(
//                           AppColors.primerColor),
//                       minHeight: 2,
//                     ),
//                     Positioned(
//                       left: isEnglish
//                           ? constraints.maxWidth * value - 2
//                           : null,
//                       right: isEnglish
//                           ? null
//                           : constraints.maxWidth * value - 2,
//                       child: Container(
//                         width: 4,
//                         height: 2,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
