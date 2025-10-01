import 'package:flutter/material.dart';
import 'package:walk_through/walking%20troughscreen/code_verification.dart';
import 'package:walk_through/walking%20troughscreen/login_sceen.dart';

class DocumentVerification3 extends StatefulWidget {
  const DocumentVerification3({super.key});

  @override
  State<DocumentVerification3> createState() => _DocumentVerification3State();
}

class _DocumentVerification3State extends State<DocumentVerification3> {
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController regExpDateController = TextEditingController();
  final TextEditingController insuranceNoController = TextEditingController();
  final TextEditingController insuranceProviderController = TextEditingController();
  final TextEditingController insuranceExpDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Top bar
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

            // 🔹 White container
            Expanded(
              child: Container(
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
                      // Stepper
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStepCircle("1", true),
                          _buildLine(),
                          _buildStepCircle("2", true),
                          _buildLine(),
                          _buildStepCircle("3", true), // Active
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Step 1", style: TextStyle(fontSize: 12)),
                          Text("Step 2", style: TextStyle(fontSize: 12)),
                          Text("Step 3", style: TextStyle(fontSize: 12, color: Colors.red)),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Title
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: 'Documents ', style: TextStyle(color: Colors.red)),
                            TextSpan(text: 'Verification', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text("Enter given detail to create your account",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),

                      const SizedBox(height: 20),

                      // Car Verification
                      const Text("Car Verification",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      const Text("Upload car documents to verify your car",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),

                      const SizedBox(height: 20),

                      // Driver license upload
                      const Text("Upload driver's license photo",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _uploadBox("Front")),
                          const SizedBox(width: 12),
                          Expanded(child: _uploadBox("Back")),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Vehicle Registration
                      const Text("Upload vehicle registration document",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      _uploadBox("Upload"),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: regNumberController,
                              decoration: const InputDecoration(
                                labelText: "Registration number",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: regExpDateController,
                              decoration: const InputDecoration(
                                labelText: "Exp date",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Insurance Document
                      const Text("Upload insurance document",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      _uploadBox("Upload"),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: insuranceNoController,
                              decoration: const InputDecoration(
                                labelText: "Insurance policy no",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: insuranceProviderController,
                              decoration: const InputDecoration(
                                labelText: "Insurance provider",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      TextField(
                        controller: insuranceExpDateController,
                        decoration: const InputDecoration(
                          labelText: "Exp date",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 30),


                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CodeVerification(),
                            ),
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),


                      const SizedBox(height: 20),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If you have an account "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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

  // 🔹 Step circle
  Widget _buildStepCircle(String number, bool isActive) {
    return Container(
      width: 28,
      height: 28,
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

  // 🔹 Upload Box Widget
  Widget _uploadBox(String label) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 30, color: Colors.grey),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
