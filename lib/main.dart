// import 'package:flutter/material.dart';
// import 'package:desktop_webview_window/desktop_webview_window.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Webview webview;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 webview.close();
//               },
//               icon: Icon(Icons.close))
//         ],
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () async {
//               webview = await WebviewWindow.create(
//                   configuration: const CreateConfiguration(
//                 openMaximized: true,
//                 title: 'Flutter Ai',
//               ));
//               webview.launch(
//                   "https://github.com/ameyreghu/desktop_wevb_view_test.git");
//             },
//             child: Text('Launch')),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import "package:webview_universal/webview_universal.dart";

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse("https://863f-116-68-78-139.ngrok-free.app"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          onPressed: () {
            webViewController.goBackSync();
          },
          child: Icon(Icons.abc),
        ),
      ),
      body: WebView(
        controller: webViewController,
      ),
    );
  }
}
