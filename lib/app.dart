import 'dart:math';

import 'package:flutter/material.dart';
import 'package:json_to_dart/features/home/presentation/view/screens/home_screen.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatelessWidget {
  final Talker talker;
  const App({required this.talker, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      navigatorObservers: [TalkerRouteObserver(talker)],
      home: HomeScreen(),
    );
  }
}

// class ResizablePanels extends StatefulWidget {
//   @override
//   _ResizablePanelsState createState() => _ResizablePanelsState();
// }

// class _ResizablePanelsState extends State<ResizablePanels> {
//   double leftWidth = 0, centerWidth = 0, rightWidth = 0;
//   final double minLeft = 100, minCenter = 150, minRight = 100;
//   // Толщина разделителя
//   final double dividerWidth = 16;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Инициализация при первом запуске
//         if (leftWidth + centerWidth + rightWidth == 0) {
//           double total = constraints.maxWidth - dividerWidth * 2;
//           leftWidth = centerWidth = rightWidth = total / 3;
//         }

//         return Row(
//           children: [
//             // Левая панель
//             SizedBox(
//               width: leftWidth,
//               child: Container(color: Colors.blueAccent),
//             ),

//             // Левый разделитель
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onHorizontalDragUpdate: (details) {
//                 double dx = details.delta.dx;
//                 setState(() {
//                   if (dx > 0) {
//                     // Перетягиваем вправо: растём влево, сначала за счёт центра, потом за счёт правой
//                     double rem = dx;
//                     double canShrinkCenter = centerWidth - minCenter;
//                     double useCenter = rem.clamp(0, canShrinkCenter);
//                     centerWidth -= useCenter;
//                     leftWidth += useCenter;
//                     rem -= useCenter;

//                     if (rem > 0) {
//                       double canShrinkRight = rightWidth - minRight;
//                       double useRight = rem.clamp(0, canShrinkRight);
//                       rightWidth -= useRight;
//                       leftWidth += useRight;
//                     }
//                   } else {
//                     // Перетягиваем влево: растём центр, за счёт левой
//                     double rem = -dx;
//                     double canShrinkLeft = leftWidth - minLeft;
//                     double useLeft = rem.clamp(0, canShrinkLeft);
//                     leftWidth -= useLeft;
//                     centerWidth += useLeft;
//                   }
//                 });
//               },
//               child: Container(
//                 width: dividerWidth,
//                 color: Colors.grey[200],
//                 child: const Center(child: Icon(Icons.more_vert)),
//               ),
//             ),

//             // Центральная панель
//             SizedBox(
//               width: centerWidth,
//               child: Container(color: Colors.greenAccent),
//             ),

//             // Правый разделитель
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onHorizontalDragUpdate: (details) {
//                 double dx = details.delta.dx;
//                 setState(() {
//                   if (dx < 0) {
//                     // Тянем влево → растёт правая панель за счёт сначала центра, потом левой
//                     double rem = -dx;
//                     // 1) ужимаем центр
//                     double canShrinkCenter = centerWidth - minCenter;
//                     double useCenter = rem.clamp(0, canShrinkCenter);
//                     centerWidth -= useCenter;
//                     rightWidth += useCenter;
//                     rem -= useCenter;
//                     // 2) если ещё есть «лишнее» — ужимаем левую
//                     if (rem > 0) {
//                       double canShrinkLeft = leftWidth - minLeft;
//                       double useLeft = rem.clamp(0, canShrinkLeft);
//                       leftWidth -= useLeft;
//                       rightWidth += useLeft;
//                     }
//                   } else if (dx > 0) {
//                     // Тянем вправо → растём центр за счёт правой (без каскада дальше)
//                     double rem = dx;
//                     double canShrinkRight = rightWidth - minRight;
//                     double useRight = rem.clamp(0, canShrinkRight);
//                     rightWidth -= useRight;
//                     centerWidth += useRight;
//                   }
//                 });
//               },
//               child: Container(
//                 width: dividerWidth,
//                 color: Colors.grey[200],
//                 child: const Center(child: Icon(Icons.more_vert)),
//               ),
//             ),

//             // Правая панель
//             SizedBox(
//               width: rightWidth,
//               child: Container(color: Colors.redAccent),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
