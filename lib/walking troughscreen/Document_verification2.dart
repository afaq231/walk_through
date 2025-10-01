import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walk_through/walking%20troughscreen/document_verfication3.dart';

class DocumentVerification2 extends StatefulWidget {
  const DocumentVerification2({super.key});

  @override
  State<DocumentVerification2> createState() => _DocumentVerification2State();
}

class _DocumentVerification2State extends State<DocumentVerification2> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // 📸 Open Camera
  Future<void> _takeSelfie() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.signal_cellular_alt, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Icon(Icons.wifi, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Icon(Icons.battery_full, color: Colors.white, size: 20),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),


            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      //  Stepper with Lines
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStepCircle("1", true),
                          _buildLine(),
                          _buildStepCircle("2", true), // Active
                          _buildLine(),
                          _buildStepCircle("3", false),
                        ],
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Step 1", style: TextStyle(fontSize: 12)),
                          Text("Step 2", style: TextStyle(fontSize: 12, color: Colors.red)),
                          Text("Step 3", style: TextStyle(fontSize: 12)),
                        ],
                      ),

                      const SizedBox(height: 30),

                      //  Title
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: 'Document ',
                                style: TextStyle(color: Colors.red)),
                            TextSpan(text: 'Verification',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Take a clear selfie to continue verification',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),

                      const SizedBox(height: 40),

                      //  Camera Box
                      GestureDetector(
                        onTap: _takeSelfie,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: _imageFile == null
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                              SizedBox(height: 8),
                              Text("Take Selfie", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(_imageFile!, fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      const Spacer(),

                      //  Next button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          if (_imageFile != null) {
                            // Proceed to Step 3
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please take a selfie first")),
                            );
                          }
                        },
                        child: InkWell(onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DocumentVerification3()));
                        },
                          child: Text(
                            "Next",
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),


                      // Bottom text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("If you have an account "),
                          GestureDetector(
                            onTap: () {
                              // Navigate to Login Screen
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Step circle
  Widget _buildStepCircle(String number, bool isActive) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // 🔹 Step line
  Widget _buildLine() {
    return Container(
      width: 40,
      height: 2,
      color: Colors.grey,
    );
  }
}
