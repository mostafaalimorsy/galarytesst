import 'package:flutter/material.dart';

class GalaryScreen extends StatelessWidget {
  const GalaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/gellary.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        "Mina",
                        style: TextStyle(fontSize: 28),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://cdn.dribbble.com/users/113337/screenshots/3957971/media/ecb958b8f07616848e99a3aeb0f04c9d.jpg?compress=1&resize=400x300&vertical=top"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login_outlined),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("log out")
                              ],
                            ))),
                  ),
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload),
                                SizedBox(
                                  width: 15,
                                ),
                                Text("upload")
                              ],
                            ))),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 248,
              width: MediaQuery.of(context).size.width / 1.1,
              child: GridView.builder(
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    "https://cdn.dribbble.com/userupload/2994903/file/original-6b523032ced2287b58d0a983f566858a.webp?compress=1&resize=320x240&vertical=top",
                    fit: BoxFit.fill,
                  ),
                ),
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
