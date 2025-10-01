import 'package:flutter/material.dart';
import 'package:walk_through/walking%20troughscreen/Document_verification2.dart';
import 'package:walk_through/walking%20troughscreen/login_sceen.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({super.key});

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '8:43 AM',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

            // Back arrow + center dots
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                      const SizedBox(width: 8),
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                      const SizedBox(width: 8),
                      Container(width: 24, height: 8, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(4))),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // White container (responsive height)
            Container(
              height: screenHeight * 0.65, // 👈 65% of screen height
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: 'Document ', style: TextStyle(color: Colors.red)),
                          TextSpan(text: 'Verification', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text(
                      'Enter given detail to create your account',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const SizedBox(height: 30),

                    // Stepper with lines
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStep("1", true),
                        _buildLine(),
                        _buildStep("2", false),
                        _buildLine(),
                        _buildStep("3", false),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Upload ID instructions
                    const Text(
                      "Upload ID Card Image",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Upload front and back side of your id card",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    const SizedBox(height: 20),

                    // Row of two containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _uploadBox("Front"),
                        _uploadBox("Back"),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Next button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {},
                      child: InkWell(onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DocumentVerification2(),));
                      },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bottom "Login" text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you have an account ",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen ()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                       // 👈 ab hamesha red
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Step with circle
  Widget _buildStep(String number, bool isActive) {
    return Column(
      children: [
        Container(
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
        ),
        const SizedBox(height: 5),
        Text("Step $number"),
      ],
    );
  }

  // Line between steps
  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey[300],
      ),
    );
  }

  // Upload box with camera icon
  Widget _uploadBox(String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Icon(Icons.camera_alt, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

