// Docs https://docs.flutter.dev/platform-integration/platform-channels?tab=android-channel-java-tab
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeFeaturesTestScreen extends StatefulWidget {
  const NativeFeaturesTestScreen({super.key});

  @override
  State<NativeFeaturesTestScreen> createState() =>
      _NativeFeaturesTestScreenState();
}

class _NativeFeaturesTestScreenState extends State<NativeFeaturesTestScreen> {
  int? _batteryLevel;
  var _testedPrinter = false;

  // Native feature
  Future<void> _getBatteryLevel() async {
    // setting up a channel to communicate with native host, given a unique identifier
    const platform = MethodChannel('electronss.flutter.dev/battery');
    try {
      // invoking a method on the channel
      final batteryLevel = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _batteryLevel = batteryLevel;
      });
    } on PlatformException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      setState(() {
        _batteryLevel = null;
      });
    }
  }

  // Native feature
  Future<void> _testDevicePrinter() async {
    const platform = MethodChannel('electronss.flutter.dev/battery');
    try {
      // invoking a method on the channel
      final testedPrinter = await platform.invokeMethod('testDevicePrinter');
      setState(() {
        _testedPrinter = testedPrinter;
      });
    } on PlatformException catch (error) {
      if (kDebugMode) {
        print(error);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
          ),
        );
      }
      setState(() {
        _testedPrinter = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _testDevicePrinter,
        child: const Icon(Icons.print),
      ),
      appBar: AppBar(
        title: const Text('Native Features Test'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Battery Level: ${_batteryLevel.toString()}'),
          ),
          Center(
            child: Text('Tested Printer: ${_testedPrinter.toString()}'),
          ),
        ],
      ),
    );
  }
}
