// import 'package:flutter/material.dart';
// import 'package:home_automation/views/wifi.dart';

// class Scan extends StatefulWidget {
//   const Scan({Key? key}) : super(key: key);

//   @override
//   State<Scan> createState() => _ScanState();
// }

// class _ScanState extends State<Scan> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: SizedBox(
//               height: 50, //height of button
//               width: 170, //width of button
//               child: ElevatedButton(
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         // Change your radius here
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         const Color(0xff548E87)),
//                   ),
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return const ConWifi();
//                     }));
//                   },
//                   child: const Text(
//                     "Connect Wifi",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       letterSpacing: 1.5,
//                     ),
//                   )))),
//     );
//   }
// }

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class Scan extends StatefulWidget {
//   static String nameRoute = '/scan';
//   const Scan({Key? key}) : super(key: key);

//   @override
//   State<Scan> createState() => _ScanState();
// }

// class _ScanState extends State<Scan> {
//   bool _flashOn = false;
//   bool _frontcam = false;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? _controller;

//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       _controller!.pauseCamera();
//     }
//     _controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 300.0
//         : 300.0;
//     return Stack(
//       children: [
//         QRView(
//           key: qrKey,
//           onQRViewCreated: (QRViewController controller) {
//             setState(() {
//               _controller = controller;
//             });
//             controller.scannedDataStream.listen((scanData) {
//               setState(() {
//                 result = scanData;
//               });
//             });
//           },
//           overlay: QrScannerOverlayShape(
//               borderColor: Colors.greenAccent,
//               borderRadius: 5,
//               borderLength: 30,
//               borderWidth: 10,
//               cutOutSize: scanArea),
//           onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//         ),
//         Align(
//             alignment: Alignment.topCenter,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const <Widget>[
//                   SizedBox(height: 20),
//                   Text(
//                     'Scan QRcode',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ])),
//         Align(
//             alignment: Alignment.topCenter,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   if (result != null)
//                     Text(
//                         'Data: ${result!.code}', //Barcode Type: ${describeEnum(result!.format)}
//                         style: const TextStyle(color: Colors.white))
//                   else
//                     const Text(
//                       'Scan a code',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                 ])),
//         Align(
//             alignment: Alignment.bottomCenter,
//             child: ButtonBar(
//               alignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   color: Colors.white,
//                   icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
//                   onPressed: () {
//                     setState(() {
//                       _flashOn = !_flashOn;
//                     });
//                     _controller?.toggleFlash();
//                   },
//                 ),
//                 IconButton(
//                   color: Colors.white,
//                   icon:
//                       Icon(_frontcam ? Icons.camera_front : Icons.camera_rear),
//                   onPressed: () {
//                     setState(() {
//                       _frontcam = !_frontcam;
//                     });
//                     _controller?.flipCamera();
//                   },
//                 ),
//               ],
//             ))
//       ],
//     );
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/views/wifi.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  static String nameRoute = '/scan';

  const QRViewExample({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 5),
                        child: MaterialButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.data == false) {
                                return SizedBox(
                                  height: 80,
                                  width: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.flash_off,
                                        size: 25,
                                      ),
                                      Text("OFF")
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: 80,
                                  width: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.flash_on,
                                        size: 25,
                                      ),
                                      Text("ON")
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 5),
                        child: MaterialButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  if (describeEnum(snapshot.data!) == 'back') {
                                    return SizedBox(
                                      height: 80,
                                      width: 40,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_rear,
                                            size: 25,
                                          ),
                                          Text("Back")
                                        ],
                                      ),
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 80,
                                      width: 40,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_front,
                                            size: 25,
                                          ),
                                          Text("Front")
                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  return Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 800 ||
            MediaQuery.of(context).size.height < 800)
        ? 300.0
        : 600.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.green,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void inputQrData(Barcode result) async {
    if (result.code != null) {
      String? jsonData = result.code;
      print(jsonData);
      // _outputController.text = result.code;

      // final data = json.decode(jsonData);
      // print(data);
      // device = Device.fromMap(data);
      // print('ini value nya');
      // print(device);
      controller?.stopCamera();
      controller?.dispose();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(ConWifi.nameRoute);
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        inputQrData(result!);
        controller.dispose();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
