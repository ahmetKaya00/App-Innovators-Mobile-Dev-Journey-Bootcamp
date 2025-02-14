import 'dart:math';

import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget{
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab>{

  bool isCarRentalSelected = true;

  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  final TextEditingController _pickupDateController = TextEditingController();
  final TextEditingController _dropoffDateController = TextEditingController();

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _departureDateController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
    );
    if(picked != null){
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showResultModal(bool isSuccess){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  size: 80,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  isSuccess ? "İşleminiz Onaylandı" : "Lütfen tüm alanları doldurunuz.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSuccess ? Colors.green : Colors.red
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "TAMAM",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ),
              ],
            ),
          );
        }
    );
  }
  void _validateAndShowResult(){
    if(isCarRentalSelected){
      if(_pickupController.text.isEmpty ||
        _dropoffController.text.isEmpty ||
          _pickupDateController.text.isEmpty ||
          _dropoffDateController.text.isEmpty){
        _showResultModal(false);
      }else{
        _showResultModal(true);
      }
    }else{
      if(_fromController.text.isEmpty ||
          _toController.text.isEmpty ||
          _departureDateController.text.isEmpty ||
          _returnDateController.text.isEmpty){
        _showResultModal(false);
      }else{
        _showResultModal(true);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.blue.shade800,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                children: [
                  Text(
                    "Yolcu360",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isCarRentalSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isCarRentalSelected ? Colors.white : Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car,
                                color: isCarRentalSelected
                                      ? Colors.blue.shade800
                                      : Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Araç Kiralama",
                                style: TextStyle(
                                  color: isCarRentalSelected
                                        ? Colors.blue.shade800
                                        : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isCarRentalSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isCarRentalSelected ? Colors.white : Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flight,
                                color: !isCarRentalSelected
                                    ? Colors.blue.shade800
                                    : Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Uçak Bileti",
                                style: TextStyle(
                                  color: !isCarRentalSelected
                                      ? Colors.blue.shade800
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                  child: isCarRentalSelected ? _buildCarRentalContent() : _buildFlightTicketContent(),
                )
            )
          ],
        ),
      );
  }
  Widget _buildCarRentalContent(){
    return Padding(
        padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _pickupController,
              decoration: InputDecoration(
               labelText: 'Alış Yeri',
               border: OutlineInputBorder(),
              ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _dropoffController,
              decoration: InputDecoration(
               labelText: 'Bırakış Yeri',
               border: OutlineInputBorder(),
              ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: TextField(
                controller: _pickupDateController,
                decoration: InputDecoration(
                  labelText: 'Alış Tarihi',
                  border: OutlineInputBorder(),
                ),
                onTap: () => _selectDate(context, _pickupDateController),
              ),
              ),
              SizedBox(width: 8),
              Expanded(child: TextField(
                controller: _dropoffDateController,
                decoration: InputDecoration(
                  labelText: 'Bırakış Tarihi',
                  border: OutlineInputBorder(),
                ),
                onTap: () => _selectDate(context, _dropoffDateController),
              ),
              )
            ],
          ),
          Spacer(),
          ElevatedButton(
              onPressed: _validateAndShowResult,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Araç Ara",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
          )
        ],
      ),
    );
  }
  Widget _buildFlightTicketContent(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _fromController,
            decoration: InputDecoration(
              labelText: 'Nereden?',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _toController,
            decoration: InputDecoration(
              labelText: 'Nereye?',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: TextField(
                controller: _departureDateController,
                decoration: InputDecoration(
                  labelText: 'Gidiş Tarihi',
                  border: OutlineInputBorder(),
                ),
                onTap: () => _selectDate(context, _departureDateController),
              ),
              ),
              SizedBox(width: 8),
              Expanded(child: TextField(
                controller: _returnDateController,
                decoration: InputDecoration(
                  labelText: 'Dönüş Tarihi',
                  border: OutlineInputBorder(),
                ),
                onTap: () => _selectDate(context, _returnDateController),
              ),
              )
            ],
          ),
          Spacer(),
          ElevatedButton(
              onPressed: _validateAndShowResult,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Uçak Ara",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
          )
        ],
      ),
    );
  }
}
