import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:socialdinner/constants.dart';
import 'package:provider/provider.dart';
import 'package:socialdinner/providers/auth.dart';

class AutoCompleteInput extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String hinttext;
  final String eventId;
  const AutoCompleteInput({
    Key? key,
    required this.hinttext,
    required this.validator,
    required this.eventId,
  }) : super(key: key);

  @override
  State<AutoCompleteInput> createState() => _AutoCompleteInputState();
}

class _AutoCompleteInputState extends State<AutoCompleteInput> {
  final TextEditingController _typeAheadController = TextEditingController();

  Future<List<String>> getMatchingUsernames(pattern) async {
    List<String> matchingnames = [];
    matchingnames = await Provider.of<Auth>(context, listen: false)
        .getMatchingUsernames(pattern, widget.eventId);
    return matchingnames;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 3,
      ),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: kPrimaryColor,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: TypeAheadFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textFieldConfiguration: TextFieldConfiguration(
            controller: _typeAheadController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 13),
              isDense: true,
              hintText: widget.hinttext,
            ),
          ),
          noItemsFoundBuilder: (context) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Dieser User existiert nicht!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            );
          },
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            elevation: 10.0,
            // shape: Border.all(color: kPrimaryMediumColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await getMatchingUsernames(pattern);
          },
          itemBuilder: (context, String suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (String suggestion) {
            _typeAheadController.text = suggestion;
          },
          validator: widget.validator,
        ),
      ),
    );
  }
}
