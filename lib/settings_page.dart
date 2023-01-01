import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'dialog_demos.dart';

/// Activity for Settings.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsState createState() => SettingsState();

}

class SettingsState extends State<SettingsPage> {

  SettingsState();

  @override
  void initState() {
    // Set any field states needed here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SettingsScreen(title: "Settings",
        children: <Widget>[
          SettingsGroup(title: "Personal Info",
              children: [
                TextInputSettingsTile(
                  title: "Name",
                  settingKey: Constants.KEY_NAME,
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name!.isNotEmpty) {
                      return null;
                    }
                    return "Your name is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "Email",
                  settingKey: Constants.KEY_EMAIL,
                  keyboardType: TextInputType.emailAddress,
                  validator: (str) {
                    if (str!.isNotEmpty) {
                      return null;
                    }
                    return "Deliverable email is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "Phone Number",
                  settingKey: Constants.KEY_PHONE,
                  keyboardType: TextInputType.phone,
                  validator: (phNum) {
                    if (phNum!.isNotEmpty) {
                      return null;
                    }
                    // Maybe check for + () - 0-9 - regex
                    return "Callable phone name is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "PIN code",
                  settingKey: Constants.KEY_PIN_CODE,
                  keyboardType: const TextInputType.numberWithOptions(signed:false, decimal:false),
                  validator: (pinCode) {
                    // The code is a 4-digit instr number + the 5-digit constant value
                    if (pinCode!.isNotEmpty  &&
                        RegExp(r'^\d+$').hasMatch(pinCode) &&
                        pinCode.length >= 5) {
                      return null;
                    }
                    return "Instructor code must be 5+ numeric digits.";
                  },
                  errorColor: Colors.redAccent,
                ),
              ]),
          SettingsGroup(
            title: "Trip Information",
            children: [
              DropDownSettingsTile<int>(
                title: 'Default Trip Length',
                settingKey: Constants.KEY_TRIP_LENGTH,
                  selected: 3,
                  values: const {
                  1: "1",
                  2: "2",
                  3: "3",
                  4: "4",
                  5: "5",
                }
              ),
              SwitchSettingsTile(
                leading: const Icon(Icons.calendar_today_rounded),
                settingKey: Constants.KEY_SAVE_TO_CAL,
                title: 'Add new trips to device calendar',
                onChange: (value) {
                  debugPrint('$Constants.KEY_SAVE_TO_CAL: $value');
                },
              ),
            ],
          ),
          SettingsGroup(
            title: "Personalization",
            children: [
              SwitchSettingsTile(
                title: "Dark mode",
                  leading: const Icon(Icons.dark_mode),
                  settingKey: Constants.KEY_DARK_MODE,
                  onChange: (val) {
                    alert(context, "Change will take effect on app restart",
                        title:'Dark Mode ${val?'on':'off'}');
                  })
              ],
          )
        ]
    );
  }

  @override
  void dispose() {
	// Do we need anything here?
	super.dispose();
  }
}

// The values used here don't matter, but must be unique,
// and having them all in one place is good for maintenance.
class Constants {
	static const KEY_NAME = "key_name";
  static const KEY_EMAIL = "key_email_addr";
	static const KEY_PHONE = "key_phone_num";
	static const KEY_PIN_CODE = "key_pin_code";
	static const KEY_TRIP_LENGTH = "key_trip_length";
	static const KEY_SAVE_TO_CAL = "key_save_to_calendar";
	static const KEY_DARK_MODE = "key_use_dark_mode";
}
