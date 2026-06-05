import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const CyberElitePanelApp());
}

class CyberElitePanelApp extends StatelessWidget {
  const CyberElitePanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CyberElitePanel(),
    );
  }
}

class CyberElitePanel extends StatefulWidget {
  const CyberElitePanel({super.key});

  @override
  State<CyberElitePanel> createState() => _CyberElitePanelState();
}

class _CyberElitePanelState extends State<CyberElitePanel> {
  double _intensity = 0.5;
  bool _isScanning = false;
  String _terminalLog = "SYSTEM READY... AWAITING COMMAND";

  void _startScanning() {
    setState(() {
      _isScanning = true;
      _terminalLog = "INITIALIZING TARGET SCANNER...\nCONNECTING TO VECTORS...";
    });

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isScanning = false;
          _terminalLog = "TARGET LOCK CONFIRMED AT VECTOR ${(_intensity * 100).toInt()}";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: Cross CrossAxisAlignment.start,
            children: [
              const Text(
                'CYBER ELITE PANEL',
                style: TextStyle(
                  color: Color(0xFF00FFCC),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'TACTICAL MODE',
                style: TextStyle(
                  color: Color(0xFF00FFCC),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Divider(color: Color(0xFF00FFCC), thickness: 1),
              Slider(
                value: _intensity,
                activeColor: const Color(0xFF00FFCC),
                inactiveColor: Colors.grey[800],
                onChanged: (value) {
                  setState(() {
                    _intensity = value;
                  });
                },
              ),
              Text(
                'INTENSITY: ${(_intensity * 100).toInt()}%',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                'TARGET SCANNER',
                style: TextStyle(
                  color: Color(0xFF00FFCC),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Divider(color: Color(0xFF00FFCC), thickness: 1),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TARGET ACQUIRED',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _isScanning ? null : _startScanning,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      foregroundColor: const Color(0xFF00FFCC),
                    ),
                    child: Text(_isScanning ? 'SCANNING...' : 'INITIATE'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'TERMINAL FEED',
                style: TextStyle(
                  color: Color(0xFF00FFCC),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Divider(color: Color(0xFF00FFCC), thickness: 1),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF00FFCC)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    _terminalLog,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
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
