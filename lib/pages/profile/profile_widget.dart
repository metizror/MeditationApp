import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/common/app_colors.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const SizedBox(
              //   height: 60,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60,
                child: Image.asset(
                  "assets/icon/avatar.png",
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text(
                  "Natalia Lebediva ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 108,
                child: Card(
                  color: AppColors.grey_bg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                child: CircleAvatar(
                                  backgroundColor: Colors.indigo,
                                  radius: 12,
                                  child: Icon(Icons.library_books, size: 12, color: Colors.white,),
                                ),
                              ),
                              TextSpan(
                                  text: " Practices", style: TextStyle(color: Colors.black, fontSize: 20)
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Sessions', style: const TextStyle(fontSize: 14),),
                                const SizedBox(width: 16,),
                                Text('13', style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Time', style: TextStyle(fontSize: 14),),
                                SizedBox(width: 16,),
                                Text('4:23:04', style: TextStyle(fontSize: 20),),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16,),

              Container(
                height: 108,
                child: Card(
                  color: AppColors.grey_bg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 12,
                                  child: Icon(Icons.spa_rounded, size: 12, color: Colors.white,),
                                ),
                              ),
                              TextSpan(
                                  text: " Meditations", style: TextStyle(color: Colors.black, fontSize: 20)
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Sessions', style: TextStyle(fontSize: 14),),
                                SizedBox(width: 16,),
                                Text('13', style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Time', style: TextStyle(fontSize: 14),),
                                SizedBox(width: 16,),
                                Text('4:23:04', style: TextStyle(fontSize: 20),),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
