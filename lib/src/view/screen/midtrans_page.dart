// import 'package:flutter/material.dart';
// import 'package:midtrans_snap/midtrans_snap.dart';

// class MidtransPage extends StatelessWidget {
//   final String snapToken;
  
//   MidtransPage({required this.snapToken});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Midtrans Payment'),
//       ),
//       body: Center(
//         child: MidtransSnap(
//           token: snapToken,
//           midtransClientKey: 'YOUR_CLIENT_KEY',
//           onComplete: (result) {
//             print('Transaction completed: ${result.toJson()}');
//             // Handle transaction completion here
//           },
//           onError: (error) {
//             print('Transaction error: $error');
//             // Handle transaction error here
//           },
//           onDismissed: () {
//             print('Transaction dismissed');
//             // Handle transaction dismissal here
//           }, mode: null,
//         ),
//       ),
//     );
//   }
// }
