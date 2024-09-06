import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_data("Strawberry Pavlova", 20, FontWeight.bold),
                    SizedBox(
                      height: 10,
                    ),
                    text_data(
                        "Indulge in the irresistible charm of our signature pastry \n, a true masterpiece crafted with love and precision.\n Each bite of this exquisite creation reveals layers of soft, buttery goodness, \ncomplemented by a delicate, golden-brown crust.",
                        15,
                        FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: media.height * 0.035,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 102, 157, 250),
                          border: Border.all(width: 0.5, color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "⭐️⭐️⭐️⭐️⭐️",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text("170 Reviews",
                                style: TextStyle(fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 102, 157, 250),
                          border: Border.all(width: 0.5, color: Colors.black)),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          RowColum(
                              Icon(
                                Icons.access_alarm,
                                color: Colors.red,
                              ),
                              "PREP:",
                              "25 min"),
                          RowColum(
                              Icon(
                                Icons.access_alarm,
                                color: Colors.red,
                              ),
                              "COOK:",
                              "1 hr"),
                          RowColum(
                              Icon(
                                Icons.apps_outage,
                                color: Colors.red,
                              ),
                              "FEEDS:",
                              "4-6"),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 3,
              child: Transform.scale(
                scale: 1,
                child: const Image(
                  image: NetworkImage(
                      "https://barona.vn/storage/meo-vat/225/cac-mon-canh-ngon-barona.jpg"),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  Expanded RowColum(Icon icon, String text, String time) {
    return Expanded(
        child: Column(
      children: [
        Container(margin: EdgeInsets.symmetric(vertical: 10), child: icon),
        Text(text
            // "PREP:"
            ),
        SizedBox(
          height: 10,
        ),
        Text(time
            // "25 min"
            ),
      ],
    ));
  }

  Container text_data(String text, double size, FontWeight fontWeight) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 102, 157, 250),
          border: Border.all(width: 1, color: Colors.black)),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
      ),
    );
  }
}
