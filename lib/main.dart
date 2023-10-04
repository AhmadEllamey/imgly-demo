import 'package:flutter/material.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

// try {
//   await PESDK.unlockWithLicense("assets/pesdk_license");
// } catch (error) {
//   debugPrint("Failed to unlock PE.SDK with: $error.");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageLY(),
    );
  }
}

class ImageLY extends StatefulWidget {
  const ImageLY({Key? key}) : super(key: key);

  @override
  State<ImageLY> createState() => _ImageLYState();
}

class _ImageLYState extends State<ImageLY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Image & Video Edidor Demo(Img.ly)",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 100,
          ),
          InkWell(
            radius: 25,
            onTap: () async {
              var result =
                  await PESDK.openEditor(image: "assets/images/logox.png");
              debugPrint("the image ---> ${result?.image}");
              debugPrint("change in image ---> ${result?.hasChanges}");
              debugPrint("image serialize ---> ${result?.serialization}");
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
                child: const Center(child: Text("Open Image")),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            radius: 25,
            onTap: () async {
              var result =
                  await VESDK.openEditor(Video("assets/videos/video.mp4"));
              debugPrint("the video ---> ${result?.video}");
              debugPrint("change in video ---> ${result?.hasChanges}");
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
                child: const Center(child: Text("Open Video")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
