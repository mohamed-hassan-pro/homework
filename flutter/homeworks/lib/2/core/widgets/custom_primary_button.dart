// import 'package:flutter/material.dart';

// import '../constants/app_dimensions.dart';
// import '../theme/app_text_styles.dart';

// class CustomPrimaryButton extends StatelessWidget {
//   final String text;
//   final Color backgroundColor;

//   const CustomPrimaryButton({
//     super.key,
//     required this.text,
//     required this.backgroundColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
//           ),
//           backgroundColor: backgroundColor,
//           padding: const EdgeInsets.symmetric(
//             vertical: AppDimensions.paddingMedium,
//           ),
//         ),
//         onPressed: () {},
//         child: Text(text, style: AppTextStyles.buttonText),
//       ),
//     );
//   }
// }
