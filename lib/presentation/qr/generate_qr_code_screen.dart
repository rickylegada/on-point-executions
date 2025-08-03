import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:on_point_executions/common/widgets/base_textfield.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';

class GenerateQRCodeScreen extends StatefulWidget {
  const GenerateQRCodeScreen({super.key});

  @override
  GenerateQRCodeScreenState createState() => GenerateQRCodeScreenState();
}

class GenerateQRCodeScreenState extends State<GenerateQRCodeScreen> {
  List<MapEntry<TextEditingController, TextEditingController>> keyValueFields = [];
  String? qrData;
  GlobalKey globalKey = GlobalKey(); // Key for capturing QR Code as image

  @override
  void initState() {
    super.initState();
    _addKeyValueField(); // Start with one key-value pair
  }

  void _addKeyValueField() {
    setState(() {
      keyValueFields.add(
        MapEntry(TextEditingController(), TextEditingController()),
      );
    });
  }

  void _generateQRCode() {
    Map<String, String> keyValueMap = {};
    for (var entry in keyValueFields) {
      String key = entry.key.text.trim();
      String value = entry.value.text.trim();
      if (key.isNotEmpty && value.isNotEmpty) {
        keyValueMap[key] = value;
      }
    }

    if (keyValueMap.isNotEmpty) {
      setState(() {
        qrData = keyValueMap.toString();
      });
    }
  }

  Future<void> _downloadQRCode() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/qr_code.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("QR Code saved to: $filePath")),
      );
    } catch (e) {
      print("Error saving QR Code: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save QR Code")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate QR Code")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: keyValueFields.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: BaseTextField(
                          controller: keyValueFields[index].key,
                          hintText: "Key",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BaseTextField(
                          controller: keyValueFields[index].value,
                          hintText: "Value",
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addKeyValueField,
              child: Text("Add More Fields"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: Text("Generate QR Code"),
            ),
            SizedBox(height: 30), // Adjusted to move QR code frame higher
            if (qrData != null)
              Column(
                children: [
                  RepaintBoundary(
                    key: globalKey,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: QrImageView(
                        data: qrData!,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _downloadQRCode,
                    icon: Icon(Icons.download),
                    label: Text("Download QR Code"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
