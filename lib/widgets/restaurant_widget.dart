import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget {
  dynamic imageurl,
      restaurantname,
      restauranttype,
      location,
      distance,
      timeupto,
      price,
      openandclosetimes;
  RestaurantWidget(
      {Key? key,
      required this.imageurl,
      required this.restaurantname,
      required this.restauranttype,
      required this.location,
      required this.distance,
      required this.timeupto,
      required this.price,
      required this.openandclosetimes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.010,
          right: MediaQuery.of(context).size.width * 0.010),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        imageurl,
                      ))),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantname,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.040,
                        width: MediaQuery.of(context).size.width * 0.20,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.010,
                            left: MediaQuery.of(context).size.height * 0.023),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Colors.green[800]),
                        child: Text(
                          restauranttype,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        location,
                        overflow: TextOverflow.visible,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        distance,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        timeupto,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('.'),
                      Text(
                        price,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('.'),
                      Text(
                        openandclosetimes,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
