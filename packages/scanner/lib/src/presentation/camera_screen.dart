import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  List<CameraDescription> cameras = [];
  final ValueNotifier<bool> isFlashOn = ValueNotifier<bool>(false);
  bool isCameraInitialised = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
    );
    await cameraController?.initialize();
    setState(() {
      isCameraInitialised = true;
    });
  }

  Future<void> takePicture() async {
    if (cameraController!.value.isInitialized) {
      final picture = await cameraController!.takePicture();
      print('Picture taken at: ${picture.path}');
    }
  }

  Future<void> toggleFlash() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      try {
        final newState = !isFlashOn.value;
        await cameraController!.setFlashMode(
          newState ? FlashMode.torch : FlashMode.off,
        );
        isFlashOn.value = newState; // Notifies UI
      } catch (e) {
        print('Flash toggle error: $e');
      }
    }
  }
   Future<XFile?> _pickImageFromGallery() async {
    final pickedImage =  await ImagePicker().pickImage(
        source: ImageSource.gallery,
    );

    return pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ),
            ),
            SizedBox(
              width: 26,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          if (isCameraInitialised)
            SizedBox.expand(
              child: CameraPreview(
                cameraController!,
              ),
            ),
          Positioned(
            top: 40,
            right: 20,
            child: ValueListenableBuilder<bool>(
              valueListenable: isFlashOn,
              builder: (context, value, _) {
                return IconButton(
                  onPressed: toggleFlash,
                  icon: Icon(
                    value ? Icons.flash_on : Icons.flash_off,
                    color: Colors.amber,
                    size: 30,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
              child:
                  IconButton(onPressed: _pickImageFromGallery, icon: const Icon(Icons.photo,
                    color: Colors.amber,
                    size: 30,),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.white,
        onPressed: takePicture,
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: Container(
          height: 40,
          width: 40,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.amber,
          ),
          child: const Icon(
            size: 30,
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
