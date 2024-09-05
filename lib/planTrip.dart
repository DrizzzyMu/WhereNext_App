import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanYourTripPage extends StatefulWidget {
  @override
  _PlanYourTripPageState createState() => _PlanYourTripPageState();
}

class _PlanYourTripPageState extends State<PlanYourTripPage> {
  String? selectedPurpose;
  int? numberOfPeople;
  bool hasKids = false;
  DateTime? arrivalDate;
  DateTime? departureDate;

  Future<void> _selectDate(BuildContext context, bool isArrival) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isArrival ? arrivalDate : departureDate)) {
      setState(() {
        if (isArrival) {
          arrivalDate = picked;
        } else {
          departureDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhereNext?',
          style: TextStyle(
            color: Colors.blue[800],  // Marine blue color
            fontFamily: 'Chivo',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue[800]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Plan Your Trip',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Purpose of Trip:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              value: selectedPurpose,
              items: ['Leisure', 'Family', 'Entertainment', 'Business']
                  .map((purpose) => DropdownMenuItem(
                        value: purpose,
                        child: Text(purpose),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPurpose = value;
                });
              },
            ),
            if (selectedPurpose == 'Family') ...[
              SizedBox(height: 20.0),
              Text(
                'Number of People:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: 'Chivo',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    numberOfPeople = int.tryParse(value);
                  });
                },
              ),
              SizedBox(height: 20.0),
              CheckboxListTile(
                title: Text(
                  'Include Kids?',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontFamily: 'Chivo',
                  ),
                ),
                value: hasKids,
                onChanged: (value) {
                  setState(() {
                    hasKids = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
            SizedBox(height: 20.0),
            Text(
              'Arrival Date:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () => _selectDate(context, true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  arrivalDate == null
                      ? 'Select Arrival Date'
                      : DateFormat('yMMMd').format(arrivalDate!),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontFamily: 'Chivo',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Departure Date:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () => _selectDate(context, false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  departureDate == null
                      ? 'Select Departure Date'
                      : DateFormat('yMMMd').format(departureDate!),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontFamily: 'Chivo',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Implement the plan trip logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800], // Marine blue button color
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Plan Your Trip',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Chivo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
