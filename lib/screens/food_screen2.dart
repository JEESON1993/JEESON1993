import 'package:flutter/material.dart';
import 'package:interview_bigb/models/food_screen2_model.dart';
import 'package:interview_bigb/services/restaurant_fetch_rest.dart';
import 'package:interview_bigb/widgets/food_avathar_widget.dart';
import 'package:interview_bigb/widgets/restaurant_widget.dart';
import 'package:interview_bigb/widgets/see_more_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool dropdown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget spacer = SizedBox(
      height: MediaQuery.of(context).size.height * 0.030,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.030,
              right: MediaQuery.of(context).size.width * 0.030,
              top: MediaQuery.of(context).size.width * 0.060,
              bottom: MediaQuery.of(context).size.width * 0.030,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.040,
                  ),
                  child: Text(
                    'Eat what makes you happy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                spacer,
                FutureBuilder<FoodModel>(
                    future: fetchFoodDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount:
                                snapshot.data!.data.branch.category.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              //childAspectRatio: (3 / 4),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return FoodAvatharWidget(
                                imageurl: snapshot.data!.data.branch
                                    .category[index].image.location,
                                fooditem: snapshot
                                    .data!.data.branch.category[index].name,
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                dropdown
                    ? FutureBuilder<FoodModel>(
                        future: fetchFoodDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount:
                                    snapshot.data!.data.branch.category.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  //childAspectRatio: (3 / 4),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return FoodAvatharWidget(
                                      imageurl: '', fooditem: '');
                                });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                    : SizedBox(),
                spacer,
                SeeMoreWidget(
                  ontapfun: () {
                    if (dropdown == false) {
                      setState(() {
                        dropdown = true;
                      });
                    } else {
                      setState(() {
                        dropdown = false;
                      });
                    }
                  },
                  dropicon: dropdown
                      ? Icon(Icons.arrow_drop_up)
                      : Icon(Icons.arrow_drop_down),
                ),
                spacer,
                FutureBuilder<FoodModel>(
                    future: fetchFoodDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.020,
                              right: MediaQuery.of(context).size.width * 0.020),
                          child: Text(
                            '${snapshot.data!.data.restaurant.length} restaurant arount you',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                spacer,
                FutureBuilder<FoodModel>(
                    future: fetchFoodDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data!.data.restaurant.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RestaurantWidget(
                                imageurl: snapshot.data!.data.restaurant[index]
                                    .storeBg.location,
                                restaurantname: snapshot
                                    .data!.data.restaurant[index].name
                                    .toUpperCase(),
                                restauranttype: snapshot
                                    .data!.data.restaurant[index].cuisine,
                                location: snapshot.data!.data.restaurant[index]
                                    .location.address,
                                distance: snapshot
                                    .data!.data.restaurant[index].distance
                                    .roundToDouble()
                                    .toString(),
                                timeupto: '30 min',
                                price: '₹120 for two',
                                openandclosetimes: snapshot
                                        .data!.data.restaurant[index].openTime
                                        .toString() +
                                    ' ' +
                                    snapshot
                                        .data!.data.restaurant[index].closeTime
                                        .toString(),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
