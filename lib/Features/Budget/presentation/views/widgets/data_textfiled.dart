import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextfiled extends StatefulWidget {
  const DateTextfiled({super.key, required this.onChangedDateField});
  final Function(String)? onChangedDateField;
  @override
  State<DateTextfiled> createState() => _DateTextfiledState();
}

class _DateTextfiledState extends State<DateTextfiled> {
    final TextEditingController _dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF5D5451);
    const Color fieldFillColor = Color(0xFFEBEBE3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date',
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: widget.onChangedDateField,
          controller: _dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'Select Date',
            filled: true,
            fillColor: fieldFillColor,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: labelColor,
              ),
              onPressed: () => _selectDate(context),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }

   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF5D5451),
              onPrimary: Colors.white,
              onSurface: Color(0xFF5D5451),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        String formattedDate = DateFormat('MM/dd/yyyy').format(picked);
        
        _dateController.text = formattedDate;
        
        if (widget.onChangedDateField != null) {
          widget.onChangedDateField!(formattedDate);
        }
      });
    }
  }
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}

