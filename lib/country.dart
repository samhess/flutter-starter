import 'dart:math' show Random;
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' show NumberFormat;
import 'package:flutter/material.dart';

Future<List<Country>> fetchAllCountries() async {
  final response = await http.get(
    Uri.parse('https://restcountries.com/v3/all'),
  );
  List<dynamic> countries = json.decode(response.body);
  return countries.map((country) => Country.fromJson(country)).toList();
}

class Country {
  final String name;
  final String region;
  final List<dynamic> capitals;
  final int population;
  final String flag;

  const Country({
    required this.name,
    required this.region,
    required this.capitals,
    required this.population,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      region: json['region'],
      capitals: json['capital'] ?? List.empty(),
      population: json['population'],
      flag: json['flags'][1],
    );
  }
}

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late Future<List<Country>> _futureCountries;
  Country? _currentCountry;

  void _getRandomCountry() async {
    final countries = await _futureCountries;
    final randomIndex = Random().nextInt(countries.length);
    final randomCountry = countries[randomIndex];

    setState(() {
      _currentCountry = randomCountry;
    });
  }

  @override
  void initState() {
    super.initState();
    _futureCountries = fetchAllCountries();
    _getRandomCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _currentCountry == null
                ? const CircularProgressIndicator()
                : CountryDetails(_currentCountry!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomCountry,
        tooltip: 'Random',
        child: const Icon(Icons.replay),
      ),
    );
  }
}

class CountryDetails extends StatelessWidget {
  final Country country;

  const CountryDetails(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('en-US');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.network(country.flag, height: 200),
        ),
        CountryProperty('Name', country.name),
        CountryProperty('Region', country.region),
        if (country.capitals.isNotEmpty)
          CountryProperty('Capital', country.capitals[0]),
        CountryProperty('Population', formatter.format(country.population)),
      ],
    );
  }
}

class CountryProperty extends StatelessWidget {
  final String property;
  final String value;

  const CountryProperty(this.property, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: '$property: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
