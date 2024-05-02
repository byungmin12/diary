import 'package:diary/core/route/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        primaryColor: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ImagePickerScreen(),
//     );
//   }
// }
//
// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ImagePickerScreen> createState() => _ImagePickerScreenState();
// }
//
// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   final imageService = ImageService(picker: ImagePicker());
//   final ImagePicker _picker = ImagePicker();
//   final List<XFile?> _pickedImages = [];
//
//   // 카메라, 갤러리에서 이미지 1개 불러오기
//   // ImageSource.galley , ImageSource.camera
//   void getImage(ImageSource source) async {
//     imageService.addImage(source);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//           child: Column(
//             children: [
//               _imageLoadButtons(),
//               const SizedBox(height: 20),
//               _gridPhoto(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 화면 상단 버튼
//   Widget _imageLoadButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             child: ElevatedButton(
//               onPressed: () => getImage(ImageSource.camera),
//               child: const Text('Camera'),
//             ),
//           ),
//           const SizedBox(width: 20),
//           SizedBox(
//             child: ElevatedButton(
//               onPressed: () => getImage(ImageSource.gallery),
//               child: const Text('Image'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 불러온 이미지 gridView
//   Widget _gridPhoto() {
//     return Expanded(
//       child: _pickedImages.isNotEmpty
//           ? GridView(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//               ),
//               children: _pickedImages
//                   .where((element) => element != null)
//                   .map((e) => _gridPhotoItem(e!))
//                   .toList(),
//             )
//           : const SizedBox(),
//     );
//   }
//
//   Widget _gridPhotoItem(XFile e) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Stack(
//         children: [
//           Positioned.fill(child: Image.file(File(e.path), fit: BoxFit.cover)),
//           Positioned(
//             top: 5,
//             right: 5,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _pickedImages.remove(e);
//                 });
//               },
//               child: const Icon(Icons.cancel_rounded, color: Colors.black87),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
