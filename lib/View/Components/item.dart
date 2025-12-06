import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  var item;
  Item({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.05, vertical: myHeight * 0.008),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: myWidth * 0.04, vertical: myHeight * 0.015),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Coin Icon
            Container(
              height: myHeight * 0.05,
              width: myHeight * 0.05,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xffFBC700).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                item.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.currency_bitcoin,
                      color: Color(0xffFBC700), size: 20);
                },
              ),
            ),
            SizedBox(width: myWidth * 0.03),

            // Coin Info
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.id,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '0.4 ' + item.symbol.toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: myWidth * 0.02),

            // Sparkline Chart
            Expanded(
              flex: 2,
              child: Container(
                height: myHeight * 0.04,
                child: Sparkline(
                  data: item.sparklineIn7D.price,
                  lineWidth: 2.5,
                  lineColor: item.marketCapChangePercentage24H >= 0
                      ? Colors.green.shade600
                      : Colors.red.shade600,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.7],
                    colors: item.marketCapChangePercentage24H >= 0
                        ? [
                            Colors.green.shade400.withOpacity(0.3),
                            Colors.green.shade100.withOpacity(0.1)
                          ]
                        : [
                            Colors.red.shade400.withOpacity(0.3),
                            Colors.red.shade100.withOpacity(0.1)
                          ],
                  ),
                ),
              ),
            ),
            SizedBox(width: myWidth * 0.03),

            // Price Info
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$ ' + item.currentPrice.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.015, vertical: 2),
                    decoration: BoxDecoration(
                      color: item.marketCapChangePercentage24H >= 0
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.marketCapChangePercentage24H >= 0
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 16,
                          color: item.marketCapChangePercentage24H >= 0
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                        ),
                        Flexible(
                          child: Text(
                            item.marketCapChangePercentage24H
                                    .toStringAsFixed(2) +
                                '%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: item.marketCapChangePercentage24H >= 0
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
