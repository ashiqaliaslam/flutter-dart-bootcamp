import 'dart:developer' show log;
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropdownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? selectedCurrency;
          getData();
        });
        log(value.toString());
      },
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (final currency in currenciesList) {
      // log(currency);
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        log(selectedIndex.toString());
        setState(() {
          selectedCurrency = selectedIndex.toString();
          getData();
        });
      },
      children: getPickerItems(),
    );
  }

  List<Text> getPickerItems() {
    List<Text> pickerItemsList = [];
    for (final currency in currenciesList) {
      var newItem = Text(currency);
      pickerItemsList.add(newItem);
    }
    return pickerItemsList;
  }

  Map<String, String> coinValues = {};

  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    log('initState of PriceScreen');
    super.initState();
    getData();
  }

  @override
  void deactivate() {
    log('deactivate of the PriceScreen');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    log('build() called of PriceScreen');
    // getDropdownItems();

    return Scaffold(
      appBar: AppBar(title: const Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CurrencyCard(
                value: isWaiting ? '?' : coinValues['BTC'],
                cryptoCurrency: 'BTC',
                selectedCurrency: selectedCurrency,
              ),
              CurrencyCard(
                value: isWaiting ? '?' : coinValues['ETH'],
                cryptoCurrency: 'ETH',
                selectedCurrency: selectedCurrency,
              ),
              CurrencyCard(
                value: isWaiting ? '?' : coinValues['LTC'],
                cryptoCurrency: 'LTC',
                selectedCurrency: selectedCurrency,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            // child: getPicker(),
          )
        ],
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String? value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
