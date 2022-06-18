import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class Blowers extends StatefulWidget {
  const Blowers({Key? key}) : super(key: key);

  @override
  State<Blowers> createState() => _BlowersState();
}

class _BlowersState extends State<Blowers> {
  late AudioPlayer player;
  late AudioCache cache;
  bool isplay = true;
  IconData playbtn = Icons.done;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('20'.tr,)
                ],
              ),
              SizedBox(height: 50,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (isplay == true) {
                          playbtn = Icons.stop;
                          playmusic();
                          isplay = false;
                        } else {
                          stopmusic();
                          playbtn = Icons.done;
                          isplay = true;
                          Navigator.pop(context);
                        }
                      });
                    },
                    icon: Icon(playbtn),
                    label: (isplay == true) ? Text('19'.tr) : Text('18'.tr),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        elevation: 30,
                        fixedSize: Size(200, 50)),
                  ),
                ],
              ),
                          SizedBox(height: 30,),
            Container(
              
              height: 150,
              width: 150,
              child:(isplay==false)? KdGaugeView(minSpeed: 0,maxSpeed: 100,speed: 100,animate: true,duration: Duration(seconds: 26),speedTextStyle:TextStyle(color: Colors.blue,fontSize: 17),unitOfMeasurement: "",alertSpeedArray: [0,50,],alertColorArray: [Colors.blue,Colors.red]):null, 
            ),
            SizedBox(height: 20,),
            Container(
               child:(isplay==false)?SpinKitHourGlass(color: Colors.blue):null, 


            )
            ],
            
          ),
        ),
      ),
    );
  }

  playmusic() {
    cache.play('Bowers.mp3');
  }

  stopmusic() {
    player.stop();
  }
}
