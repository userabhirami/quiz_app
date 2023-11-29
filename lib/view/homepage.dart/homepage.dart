import 'package:flutter/material.dart';
import 'package:flutter_application_20/utils/database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? checkvalue;
  int value = 0;

  void counter() {
    value = value + 1;
    setState(() {});
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text("${value + 1}/${DataBase.myData.length}")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(DataBase.myData[value]['question']),
            SizedBox(
              height: 50,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // print(index);
                        checkvalue = index;
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        color: checkvalue == index
                            ? checkvalue == DataBase.myData[value]['answer']
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                        child: Center(
                            child:
                                Text(DataBase.myData[value]['options'][index])),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    )),
            Text(value.toString()),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  counter();
                  checkvalue = 5;
                  setState(() {});
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}
