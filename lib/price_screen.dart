import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'networking.dart';



String selectedCurrency = 'USD';
class PriceScreen extends StatefulWidget {

  String sentCurrency(){
    print(selectedCurrency);
    return selectedCurrency;
  }
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {



  double rate;
  Future<double> getData()async{
    Networking networking = Networking();
      rate = await networking.getExchangeRates();
     rate = rate.floorToDouble();
     return rate;

  }

  List<Text> getPickerItems(){
    List<Text> pickerItem = [];
    for(String currency in currenciesList){
      pickerItem.add(Text(currency));
    }
    return pickerItem;

  }



  @override


  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC =  $selectedCurrency $rate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              magnification: 1.3,
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged:(value){
                selectedCurrency = currenciesList[value];

                setState(() {
                  selectedCurrency = currenciesList[value];

                  }
                );
              },

              children: getPickerItems(),
            )

                ),

        ],
      ),
    );
  }
}
