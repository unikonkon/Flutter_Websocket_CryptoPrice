import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_websocket_app/app.dart';
import 'package:flutter_websocket_app/model_data.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketPage extends StatefulWidget {
  const WebsocketPage({Key? key}) : super(key: key);

  @override
  State<WebsocketPage> createState() => _WebsocketPageState();
}

class _WebsocketPageState extends State<WebsocketPage> {
  String priceBTC = "0";
  String perBTC = "0";
  String priceETH = "0";
  String perETH = "0";

  final channelbtc = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@ticker');
  final channelETH = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/ethusdt@ticker');

  @override
  void initState() {
    super.initState();
    getpricebtc();
  }

  getpricebtc() {
    channelbtc.stream.listen((message) {
      Map getDataprice = jsonDecode(message);

      setState(() {
        priceBTC = getDataprice['x'];
        perBTC = getDataprice['P'];
      });
      // print(getData['p']);
      // print(getData['o']);
    });

    channelETH.stream.listen((message) {
      Map getDataprice = jsonDecode(message);

      setState(() {
        priceETH = getDataprice['x'];
        perETH = getDataprice['P'];
      });
      // print(getData['p']);
      // print(getData['o']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Crypto Price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            SizedBox(
              height: 30.h,
            ),
            btc(),
            eth(),
          ],
        ),
      ),
    );
  }

  Widget btc() {
    return Card(
      color: Color.fromARGB(255, 55, 55, 56),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
        width: 330,
        height: 65,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 7.h,
            bottom: 7.h,
            right: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'BTC/USDT',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              Column(
                children: [
                  Text(
                    priceBTC,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    perBTC,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eth() {
    return Card(
      color: Color.fromARGB(255, 55, 55, 56),
      shape: const RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
        width: 330,
        height: 65,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 7.h,
            bottom: 7.h,
            right: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ETH/USDT',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              Column(
                children: [
                  Text(
                    priceETH,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    perETH,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DataList extends StatelessWidget {
//   const DataList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           // var data = dataList[index];
//           // print(data);
//           return Column(
//             children: [
//               Text(
//                 price,
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Text(
//                 data.namedata,
//                 style: TextStyle(fontSize: 15),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
