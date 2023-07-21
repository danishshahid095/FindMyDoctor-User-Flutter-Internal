import 'package:flutter/material.dart';

class Vedio_call_Screen extends StatefulWidget {
  const Vedio_call_Screen({super.key});

  @override
  State<Vedio_call_Screen> createState() => _Vedio_call_ScreenState();
}

class _Vedio_call_ScreenState extends State<Vedio_call_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.amber,
            child: Image.asset(
              'assets/images/doctor.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 90,
            left: 285,
            child: Container(
              height: 100, width: 100,
              // color: Colors.amber,
              child: Image.asset(
                'assets/images/patient.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 10,
              child: Container(
                height: 50,
                width: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                  ),
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: 740,
            left: 100,
            //right: 200,
            child: Container(
              height: 50,

              width: 200,
              // color: Colors.amberAccent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          'assets/images/Mute.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          'assets/images/callend.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          'assets/images/callmute.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
