import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // Default selected currencies
  String fromCurrency = "SGD";
  String toCurrency = "USD";
  String fromFlag = "https://flagcdn.com/w40/sg.png"; // Singapore flag URL
  String toFlag = "https://flagcdn.com/w40/us.png"; // US flag URL

  List<Map<String, String>> countries = []; // Holds country list from API

  @override
  void initState() {
    super.initState();
    fetchCountries(); // Fetch countries on screen load
  }

  // Fetch Country and Currency Data from API
  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        countries = data
            .where((country) => country["currencies"] != null)
            .map((country) {
          String currencyCode = country["currencies"]?.keys?.first ?? "N/A";
          String flagUrl = country["flags"]["png"];
          String countryName = country["name"]["common"];
          return {
            "name": countryName,
            "code": currencyCode,
            "flag": flagUrl,
          };
        }).toList();
      });
    } else {
      throw Exception("Failed to load countries");
    }
  }

  // Function to Show Country Selector Modal
  void showCurrencySelector(bool isFromCurrency) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Search Box
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search currency...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (query) {
                  setState(() {
                    countries = countries.where((country) =>
                    country["name"]!.toLowerCase().contains(query.toLowerCase()) ||
                        country["code"]!.toLowerCase().contains(query.toLowerCase())).toList();
                  });
                },
              ),
              SizedBox(height: 10),

              // List of Currencies
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        countries[index]["flag"]!,
                        width: 30,
                        height: 30,
                      ),
                      title: Text("${countries[index]["name"]} (${countries[index]["code"]})"),
                      onTap: () {
                        setState(() {
                          if (isFromCurrency) {
                            fromCurrency = countries[index]["code"]!;
                            fromFlag = countries[index]["flag"]!;
                          } else {
                            toCurrency = countries[index]["code"]!;
                            toFlag = countries[index]["flag"]!;
                          }
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.arrow_back_ios, color: Color(0xFF083A40)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/iTravelLogo.png', width: 30, height: 30),

            Text(
              "Travel",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                color: Color(0xFF083A40),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_rounded, color: Color(0xFF083A40), size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 45, top: 150),
        child: Container(
          width: 329,
          height: 318,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF11818D),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Amount Section
              buildCurrencyRow(true),

              SizedBox(height: 20),

              // Divider with converter icon
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(color: Color(0xFFF5F5F5), thickness: 2),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.swap_vert_rounded, color: Color(0xFFF25E7A), size: 35),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Converted Amount Section
              buildCurrencyRow(false),
            ],
          ),
        ),
      ),
    );
  }

  // Function to Build Currency Row (Reusable)
  Widget buildCurrencyRow(bool isFromCurrency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isFromCurrency ? "Amount" : "Converted Amount",
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              isFromCurrency ? fromFlag : toFlag,
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),

            // Currency Name + Arrow in Row
            GestureDetector(
              onTap: () => showCurrencySelector(isFromCurrency),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isFromCurrency ? fromCurrency : toCurrency,
                    style: TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down, color: Color(0xFFF5F5F5), size: 20),
                ],
              ),
            ),

            Spacer(),

            Container(
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(color: Color(0xFF083A40), fontSize: 16),
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: isFromCurrency ? "1000.00" : "736.00"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
