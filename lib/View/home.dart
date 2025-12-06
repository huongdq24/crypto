import 'package:crypto/Model/coinModel.dart';
import 'package:crypto/View/Components/item.dart';
import 'package:crypto/View/Components/item2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: myHeight,
          width: myWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFFD700),
                  Color(0xffFFA500),
                  Color(0xffFF8C00),
                ],
                stops: [
                  0.0,
                  0.5,
                  1.0
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: myHeight * 0.025, horizontal: myWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: myWidth * 0.045,
                          vertical: myHeight * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                      child: Text(
                        'Main portfolio',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFF8C00),
                            letterSpacing: 0.3),
                      ),
                    ),
                    Text(
                      'Top 10 coins',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.85)),
                    ),
                    Text(
                      'Experimental',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.85)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$ 7,466.20',
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(2, 2))
                              ]),
                        ),
                        SizedBox(height: myHeight * 0.005),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.025,
                              vertical: myHeight * 0.004),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            '+162% all time',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade800),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(myWidth * 0.03),
                      height: myHeight * 0.055,
                      width: myHeight * 0.055,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: Offset(0, 4))
                          ]),
                      child: Image.asset(
                        'assets/icons/5.1.png',
                        color: Color(0xffFBC700),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Expanded(
                child: Container(
                  width: myWidth,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            offset: Offset(0, -5))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: myHeight * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: myWidth * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assets',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  letterSpacing: 0.5),
                            ),
                            Icon(Icons.add)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: myHeight * 0.015,
                      ),
                      Container(
                        height: myHeight * 0.32,
                        child: isRefreshing == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xffFBC700),
                                ),
                              )
                            : coinMarket == null || coinMarket!.length == 0
                                ? Padding(
                                    padding: EdgeInsets.all(myHeight * 0.06),
                                    child: Center(
                                      child: Text(
                                        'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Item(
                                        item: coinMarket![index],
                                      );
                                    },
                                  ),
                      ),
                      SizedBox(
                        height: myHeight * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: myWidth * 0.06),
                        child: Row(
                          children: [
                            Text(
                              'Recommend to Buy',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  letterSpacing: 0.5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: myWidth * 0.03, bottom: myHeight * 0.01),
                          child: isRefreshing == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xffFBC700),
                                  ),
                                )
                              : coinMarket == null || coinMarket!.length == 0
                                  ? Padding(
                                      padding: EdgeInsets.all(myHeight * 0.06),
                                      child: Center(
                                        child: Text(
                                          'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: coinMarket!.length,
                                      itemBuilder: (context, index) {
                                        return Item2(
                                          item: coinMarket![index],
                                        );
                                      },
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
