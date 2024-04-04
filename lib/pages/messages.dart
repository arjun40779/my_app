import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/input_text_formatter/date_formatter.dart';
import '../components/input_text_formatter/ohip_text_formatter.dart';
import '../utils/size_config.dart';
import '../components/inputfield/input_component.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late FocusNode _dobFocusNode;
  late FocusNode _oHIPFocusNode;
  TextEditingController? _dobController;
  TextEditingController? _oHIPController;

  @override
  void initState() {
    super.initState();
    _dobFocusNode = FocusNode();
    _oHIPFocusNode = FocusNode();

    _dobController = TextEditingController(text: "");
    _oHIPController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _dobFocusNode.dispose();
    _oHIPFocusNode.dispose();

    if (_dobController != null) _dobController!.dispose();
    if (_oHIPController != null) _oHIPController!.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final EdgeInsets paddingform = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier,
      horizontal: SizeConfig.widthMultiplier * 2);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: paddingform,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          // Card Input Field
          CustomInput<String>(
            required: true,
            label: 'Date of Birth',
            focusNode: _dobFocusNode,
            controller: _dobController,
            placeholderText: "YYYY-MM-DD",
            type: TextInputType.datetime,
            validation: _validateDate,
            textFormatters: [
              DateFormatter(),
            ],
            rightIconButton: IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
          CustomInput(
            label: "OHIP (optional)",
            placeholderText: "Enter OHIP number",
            controller: _oHIPController,
            focusNode: _oHIPFocusNode,
            type: TextInputType.number,
            validation: (value) {
              if (value.isNotEmpty && value.length < 12) {
                return "OHIP Number must be 10 digits";
              }
              return null;
            },
            textFormatters: [
              OHIPNumberFormatter(),
            ],
            onChange: (value) {
              return value;
            },
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
            child: CustomButton(
                size: ButtonSize.regular,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                text: "SUBMIT"),
          ),
        ]),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null) {
      final String year = picked.year.toString();
      final String month =
          picked.month < 10 ? "0${picked.month}" : "${picked.month}";
      final String day = picked.day < 10 ? "0${picked.day}" : "${picked.day}";
      setState(() {
        _dobController!.text = "$year-$month-$day";
      });
    }
  }

  int getDaysInMonth(int year, int month) {
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(const Duration(days: 1));
    return lastDayOfCurrentMonth.day;
  }

  String? _validateDate(value) {
    List<String> date = value.split("-");
    DateTime currDate = DateTime.now();
    int currYear = currDate.year;
    int currMonth = currDate.month;
    int currDay = currDate.day;

    if (value.isNotEmpty) {
      if (value.length > 3) {
        int year = int.parse(date[0]);

        if (year < 1900 || year > currYear) {
          return "Invalid year";
        }
        if (value.length > 6) {
          int month = int.parse(date[1]);
          if (month < 1 ||
              month > 12 ||
              (currYear == year && month > currMonth)) {
            return "Invalid month";
          }
          if (value.length > 9) {
            int day = int.parse(date[2]);
            int maxDateInMonth = getDaysInMonth(year, month);

            if (day < 1 ||
                day > maxDateInMonth ||
                (currYear == year && currMonth == month && day > currDay)) {
              return "invalid day";
            }
          }
        }
      }
    }
    if (value.length < 10) return "please enter valid date";
    return null;
  }
}
