import 'package:eesac/view/webview.dart';
import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Setting "),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: urlController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid url';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Website Url ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const BuildDropdownButton(),
              const Spacer(),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      navigateTo(
                          context, WebViewScreen(url: urlController.text));
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
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

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
List<String> bluetoothDevices = ['Bluetooth Device'];
List<String> wifiDevices = ['Wi-Fi Device'];

List<String> networkDevices = [...bluetoothDevices, ...wifiDevices];
String selectedDevice = networkDevices[0];

class BuildDropdownButton extends StatefulWidget {
  const BuildDropdownButton({super.key});

  @override
  State<BuildDropdownButton> createState() => _BuildDropdownButtonState();
}

class _BuildDropdownButtonState extends State<BuildDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDevice,
      onChanged: (String? newValue) {
        setState(() {
          selectedDevice = newValue!;
        });
      },
      items: networkDevices.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          onTap: () {
            setState(() {
              if (value == "Bluetooth Device") {
                openBluetoothSettingsPage();
              } else {
                openWifiSettingsPage();
              }
            });
          },
          child: Text(value),
        );
      }).toList(),
      hint: const Text('Select Network Device'),
    );
  }
}

void openBluetoothSettingsPage() async {
  OpenSettings.openBluetoothSetting();
}

void openWifiSettingsPage() async {
  OpenSettings.openWIFISetting();
}
