import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:walk_through/walking%20troughscreen/Document_verfication.dart';
import 'package:walk_through/walking%20troughscreen/login_sceen.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  _PersonalInformationState  createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool hasCar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Personal Information",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () {
              // Next page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Enter given details to create your account",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),


            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "First name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Last name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),


            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Full address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),


            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Country",
                border: OutlineInputBorder(),
              ),
              items: ["Pakistan", "India", "USA", "UK"]
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 15),


            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "City",
                border: OutlineInputBorder(),
              ),
              items: ["Karachi", "Lahore", "Islamabad", "Quetta"]
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 15),


            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Do you have a car?", style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(
                    hasCar ? Icons.check_circle : Icons.circle_outlined,
                    color: hasCar ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      hasCar = !hasCar;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),

            if (hasCar) ...[

              Text("Car brand"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter car brand",
                ),
              ),
              SizedBox(height: 15),


              Text("Year of manufacture"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter year",
                ),
              ),
              SizedBox(height: 15),

              // Car model
              Text("Car model"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter car model",
                ),
              ),
              SizedBox(height: 15),


              Text("Number plate"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter number plate",
                ),
              ),
              SizedBox(height: 20),
            ],


            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: InkWell(child: Text("Continue", style: TextStyle(color:
                Colors.white),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DocumentVerification(),));
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            // Login link
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'If you have an account ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen(),));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
