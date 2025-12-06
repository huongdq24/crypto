import 'package:crypto/View/selectCoin.dart';
import 'package:flutter/material.dart';

class Item2 extends StatelessWidget {
  var item;
  Item2({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.015, vertical: myHeight * 0.002),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectCoin(
                        selectItem: item,
                      )));
        },
        child: Container(
          width: myWidth * 0.35,
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.03, vertical: myHeight * 0.009),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.grey.shade50,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: Offset(0, 6),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0xffFBC700).withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 3),
                spreadRadius: -2,
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Coin Icon
              Container(
                height: myHeight * 0.04,
                width: myHeight * 0.04,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xffFBC700).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  item.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.currency_bitcoin,
                        color: Color(0xffFBC700), size: 16);
                  },
                ),
              ),
              SizedBox(height: myHeight * 0.005),

              // Coin Name
              Text(
                item.id,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 0.2,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: myHeight * 0.003),

              // Price Change
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.02,
                  vertical: myHeight * 0.002,
                ),
                decoration: BoxDecoration(
                  color: item.priceChange24H >= 0
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item.priceChange24H.toString().contains('-')
                      ? "-\$" +
                          item.priceChange24H
                              .toStringAsFixed(2)
                              .toString()
                              .replaceAll('-', '')
                      : "+\$" + item.priceChange24H.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: item.priceChange24H >= 0
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: myHeight * 0.003),

              // Percentage Change
              Row(
                children: [
                  Icon(
                    item.marketCapChangePercentage24H >= 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    size: 16,
                    color: item.marketCapChangePercentage24H >= 0
                        ? Colors.green.shade600
                        : Colors.red.shade600,
                  ),
                  SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      item.marketCapChangePercentage24H.toStringAsFixed(2) +
                          '%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: item.marketCapChangePercentage24H >= 0
                            ? Colors.green.shade600
                            : Colors.red.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
