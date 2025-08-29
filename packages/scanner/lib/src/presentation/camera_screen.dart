import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ValueNotifier<Barcode?> _barcode = ValueNotifier<Barcode>(
    const Barcode(),
  );
  bool detectEnabled = false;
  final scanController = MobileScannerController();
  final ValueNotifier<bool> isFlashOn = ValueNotifier<bool>(false);
  final ValueNotifier<String> barcodeData = ValueNotifier<String>('');
  final ValueNotifier<double> _turns = ValueNotifier<double>(0);

  Future<void> takePicture() async {}

  Future<void> toggleFlash() async {
    try {
      final newState = !isFlashOn.value;
      await scanController.toggleTorch();
      isFlashOn.value = newState;
    } catch (e) {
      debugPrint('Flash toggle error: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    try {
      final capture = await scanController.analyzeImage(picked.path);
      if (capture == null || capture.barcodes.isEmpty) {
        debugPrint('No barcode found in image');
      } else {
        for (final b in capture.barcodes) {
          final value = b.displayValue ?? b.rawValue ?? '';
          await getIngredients(value);
        }
      }
    } catch (e) {
      debugPrint('analyzeImage error: $e');
    }
  }

  Future<String> getIngredients(String barcode) async {
    final url = Uri.parse(
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
    );
    final response = await http.get(url);
    detectEnabled = false;
    if (response.statusCode == 200) {
      barcodeData.value = response.body;
      debugPrint(barcodeData.value);
      return barcodeData.value;
    } else {
      throw Exception('Failed to load ingredients');
    }
  }

  Widget _barcodePreview(Barcode? value) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            value?.displayValue ?? 'Scan Something',
            overflow: TextOverflow.fade,
            style: const TextStyle(color: Colors.white),
          ),
          ValueListenableBuilder(
            valueListenable: barcodeData,
            builder: (context, value, child) {
              return Text(
                barcodeData.value,
                overflow: TextOverflow.fade,
                style: const TextStyle(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (!detectEnabled) return; // Detect only when enabled
    setState(() {
      _barcode.value = barcodes.barcodes.firstOrNull;
      getIngredients(_barcode.value! as String);
      detectEnabled = false; // stop after one detection
    });
  }

  Future<void> _toggleCamera() async {
    try {
      await scanController.switchCamera();
      _turns.value += 1;
    } catch (e) {
      debugPrint('Camera toggle error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(
              width: 26,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
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
          MobileScanner(
            controller: scanController,
            onDetect:
                // _handleBarcode,
                (capture) {
              final barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  _barcode.value = barcode;
                  getIngredients(barcode.rawValue.toString());
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              }
            },
            overlayBuilder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.7,
                height: constraints.maxHeight * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ValueListenableBuilder(
              valueListenable: _turns,
              builder: (context, value, child) {
                return AnimatedRotation(
                  duration: const Duration(milliseconds: 400),
                  turns: _turns.value,
                  child: IconButton(
                    onPressed: _toggleCamera,
                    icon:  const Icon(
                      Icons.cameraswitch,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 170,
            child: ValueListenableBuilder<bool>(
              valueListenable: isFlashOn,
              builder: (context, value, _) {
                return IconButton(
                  onPressed: toggleFlash,
                  icon: AnimatedSwitcher(
                    key: ValueKey(isFlashOn),
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.bounceIn,
                    switchOutCurve: Curves.bounceOut,
                    child: Icon(
                      value ? Icons.flash_off : Icons.flash_on,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: _pickImageFromGallery,
              icon: const Icon(
                Icons.photo,
                color: Colors.amber,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 105,
            left: 20,
            right: 20,
            child: Container(
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _barcode,
                    builder: (context, value, child) {
                      return _barcodePreview(_barcode.value);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.white,
        onPressed: () {
          // setState(() {
          //   detectEnabled = true;
          //   _barcode.value = null;
          // });
        },
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
}
