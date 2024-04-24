import 'dart:ui';

import 'package:custom/snackbar.dart';
import 'package:custom/view/screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:pulsator/pulsator.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Progress Indicator',
      home:  HomePage(),
    );
  }
}

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void loadData() {
//     setState(() {
//       isLoading = true;
//     });
//
//     // Simulate loading data
//     Timer(const Duration(seconds: 3), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Row(
//             children: [
//               Text(
//                 'a-',
//                 style: GoogleFonts.acme(
//                   textStyle: const TextStyle(
//                       letterSpacing: 3,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.brown),
//                 ),
//               ),
//               const SizedBox(width: 4.0),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.brown, width: 1.3),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.3), // Reduced padding
//                   child: Stack(
//                     children: [
//                       RotationTransition(
//                         turns: _animationController,
//                         child: SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CustomPaint(
//                             painter: MoonPainter(
//                               wdth2: 0.7,
//                               hght2: 0.7,
//                               operation: (a, b) => a - b,
//                               hght: 0.7,
//                               wdth: 0.7,
//                               thickness: 0.8, // Reduced thickness
//                             ),
//                           ),
//                         ),
//                       ),
//                       RotationTransition(
//                         turns: _animationController,
//                         child: SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CustomPaint(
//                             painter: MoonPainter(
//                               operation: (a, b) => a + b,
//                               hght: 0.5,
//                               wdth: 0.5,
//                               wdth2: 0.47,
//                               hght2: 0.47,
//                               thickness: 0.8,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 2.0),
//               Text(
//                 'k',
//                 style: GoogleFonts.acme(
//                   textStyle: TextStyle(
//                       letterSpacing: 3,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.brown),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipRect(
//                     child: SizedBox(
//                       height: 220,
//                       width: 220,
//                       child: Pulsator(
//                         style: const PulseStyle(
//                             color: Colors.white,
//                             borderWidth: 3.0,
//                             borderColor: Colors.brown),
//                         count: 1,
//                         duration: const Duration(seconds: 8),
//                         startFromScratch: true,
//                         autoStart: true,
//                         fit: PulseFit.contain,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(color: Colors.brown, width: 4),
//                               shape: BoxShape.circle),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Stack(
//                               // mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 RotationTransition(
//                                   turns: _animationController,
//                                   child: SizedBox(
//                                     width: 100,
//                                     height: 100,
//                                     child: CustomPaint(
//                                       painter: MoonPainter(
//                                           wdth2: 0.7,
//                                           hght2: 0.7,
//                                           operation: (a, b) => a - b,
//                                           hght: 0.7,
//                                           wdth: 0.7,
//                                           thickness: 3),
//                                     ),
//                                   ),
//                                 ),
//                                 RotationTransition(
//                                   turns: _animationController,
//                                   child: SizedBox(
//                                     width: 100,
//                                     height: 100,
//                                     child: CustomPaint(
//                                       painter: MoonPainter(
//                                           operation: (a, b) => a + b,
//                                           hght: 1,
//                                           wdth: 1,
//                                           wdth2: 0.97,
//                                           hght2: 0.97,
//                                           thickness: 2),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 'Let’s start a Ripple of Kindness',
//                 style: GoogleFonts.actor(
//                   textStyle: const TextStyle(
//                       letterSpacing: 3, fontSize: 16, color: Colors.black),
//                 ),
//               ),
//               Text(
//                 'Your first act of Kindness is just a Coffee away!',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.actor(
//                   textStyle: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 3,
//                       fontSize: 16,
//                       color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// typedef MathOperation = double Function(double, double);
//
// class MoonPainter extends CustomPainter {
//   final double hght;
//   final double wdth;
//   final double hght2;
//   final double wdth2;
//   final double thickness;
//   final MathOperation operation;
//
//   MoonPainter({
//     required this.hght,
//     required this.wdth,
//     required this.operation,
//     required this.hght2,
//     required this.wdth2,
//     required this.thickness,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final paint = Paint()
//       ..shader = const LinearGradient(
//         begin: Alignment.topRight,
//         end: Alignment.bottomLeft,
//         colors: [
//           Colors.brown,
//           Colors.brown,
//           Colors.brown,
//           Colors.brown,
//         ],
//       ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
//
//     Path path1 = Path()
//       ..addOval(Rect.fromCenter(
//           center: center,
//           width: size.width * wdth,
//           height: size.height * hght));
//
//     Path path2 = Path()
//       ..addOval(
//         Rect.fromCenter(
//           center: Offset(
//             operation(center.dx, thickness),
//             operation(center.dx, thickness),
//           ),
//           width: size.width * wdth2,
//           height: size.height * hght2,
//         ),
//       );
//     canvas.drawPath(
//       Path.combine(PathOperation.difference, path1, path2),
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

/// A custom painter that creates a liquid-like animation using a sine wave.
// class LiquidPainter extends CustomPainter {
//   final double value;
//   final double maxValue;
//
//   /// Creates a [LiquidPainter] with the given [value] and [maxValue].
//   LiquidPainter(this.value, this.maxValue);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     double diameter = min(size.height, size.width);
//     double radius = diameter / 2;
//
//     // Defining coordinate points. The wave starts from the bottom and ends at the top as the value changes.
//     double pointX = 0;
//     double pointY = diameter -
//         ((diameter + 10) *
//             (value /
//                 maxValue)); // 10 is an extra offset added to fill the circle completely
//
//     Path path = Path();
//     path.moveTo(pointX, pointY);
//
//     // Amplitude: the height of the sine wave
//     double amplitude = 1;
//
//     // Period: the time taken to complete one full cycle of the sine wave.
//     // f = 1/p, the more the value of the period, the higher the frequency.
//     double period = value / maxValue;
//
//     // Phase Shift: the horizontal shift of the sine wave along the x-axis.
//     double phaseShift = value * pi;
//
//     // Plotting the sine wave by connecting various paths till it reaches the diameter.
//     // Using this formula: y = A * sin(ωt + φ) + C
//     for (double i = 0; i <= diameter; i++) {
//       path.lineTo(
//         i + pointX,
//         pointY + amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
//       );
//     }
//
//     // Plotting a vertical line which connects the right end of the sine wave.
//     path.lineTo(pointX + diameter, diameter);
//     // Plotting a vertical line which connects the left end of the sine wave.
//     path.lineTo(pointX, diameter);
//     // Closing the path.
//     path.close();
//
//     Paint paint = Paint()
//       ..shader = const SweepGradient(
//               colors: [
//                 Color(0xffFF7A01),
//                 Color(0xffFF0069),
//                 Color(0xff7639FB),
//               ],
//               startAngle: pi / 2,
//               endAngle: 5 * pi / 2,
//               tileMode: TileMode.clamp,
//               stops: [
//                 0.25,
//                 0.35,
//                 0.5,
//               ])
//           .createShader(Rect.fromCircle(
//               center: Offset(diameter, diameter), radius: radius))
//       ..style = PaintingStyle.fill;
//
//     // Clipping rectangular-shaped path to Oval.
//     Path circleClip = Path()
//       ..addOval(Rect.fromCenter(
//           center: Offset(radius, radius), width: diameter, height: diameter));
//     canvas.clipPath(circleClip, doAntiAlias: true);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
