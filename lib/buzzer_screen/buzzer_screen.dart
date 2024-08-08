import 'package:flutter/material.dart';

//TODO: Import the buzzer_service.dart file
import 'package:udemy_buzzer_gpio/buzzer_service/buzzer_service.dart';

class BuzzerScreen extends StatefulWidget {
  const BuzzerScreen({super.key});

  @override
  State<BuzzerScreen> createState() => _BuzzerScreenState();
}

class _BuzzerScreenState extends State<BuzzerScreen> {
  //TODO: Create an instance of the BuzzerService class
final BuzzerService buzzerService = BuzzerService();
  //TODO: Call the initGpio16Output method in the initState method
  @override
  void initState() {
    buzzerService.initGpio16Output();
    super.initState();
  }

  //TODO: Call the disposeGpio method in the dispose method
  @override
  void dispose() {
    buzzerService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Create a Scaffold widget
    return Scaffold(
      //TODO: Add an AppBar widget
      appBar: AppBar(
        title: const Text('Udemy Buzzer GPIO'),
        centerTitle: true,
      ),
      //TODO: Add a Center widget
      body: Center(
        //TODO: Add a Column widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Add the getElevatedButtonBuzzerOn method
            getElevatedButtonBuzzerOn(),
            const SizedBox(height: 20),
            //TODO: Add the getElevatedButtonBuzzerOff method
            getElevatedButtonBuzzerOff(),
          ],
        ),
      ),
    );
  }

//TODO: Create the getElevatedButtonBuzzerOn method
  Widget getElevatedButtonBuzzerOn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          buzzerService.gpio16OutputLevel(true);
        });
      },
      child: const Text(
        'GPIO16 High Buzzer On',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

//TODO: Create the getElevatedButtonBuzzerOff method
  Widget getElevatedButtonBuzzerOff() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          buzzerService.gpio16OutputLevel(false);
        });
      },
      child: const Text(
        'GPIO16 Low Buzzer Off',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}
