import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melissapp/nsc_selector/bloc/nsc_selector_bloc.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class NscSelector extends StatefulWidget {

  NscSelector({Key key}) : super(key: key);

  @override
  _NscSelectorState createState() => _NscSelectorState();

}

class _NscSelectorState extends State<NscSelector> {

  Column buildColumnWithData(BuildContext context, String numberOfYears){
    return Column(
      children: <Widget>[
        Text(numberOfYears),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return Container(
      child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             AutoSizeText(
               "Années d'études",
               style: Theme.of(context).textTheme.title,
             ),
             Container(
               margin: EdgeInsets.all(16),
               child: StudiesPicker(),),
             BlocBuilder<NscSelectorBloc, NscSelectorState>(
              builder: (BuildContext context, NscSelectorState state) {
                if(state is NscSelectorInitial){
                  return AutoSizeText("Pas de niveau d'études sélectionné", maxLines: 1,);
                } else if(state is NumberOfYearsComputed){
                  return buildColumnWithData(context, state.numberOfYearsFormatted);
                } else {
                  return AutoSizeText("Pas de niveau d'études sélectionné", maxLines: 1,);
                }
              },
            )
           ],
         ),
    );
  }
}

class StudiesPicker extends StatefulWidget {
  StudiesPicker({Key key}) : super(key: key);

  @override
  _StudiesPickerState createState() => _StudiesPickerState();

  static final Map<int, String> listValues = {
    1: "CP",
    2: "CE1",
    3: "CE2",
    4: "CM1",
    5: "CM2",
    6: "6ème",
    7: "5ème",
    8: "4ème",
    9: "3ème - CAP",
    10: "2nde - BEP",
    11: "1ère",
    12: "Terminale",
    13: "Bac +1",
    14: "Bac +2",
    15: "Bac +3",
    17: "Bac +5",
    20: "Bac +8",
  };
}

class _StudiesPickerState extends State<StudiesPicker> {

  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];
  String selectedValue;
  int selectedValueDropDown = 0;

  @override
  void initState() {
    
    StudiesPicker.listValues.forEach((key, value) => items.add(DropdownMenuItem(child: Text(value, style: TextStyle(color: Colors.black),), value: value)));
    super.initState();
    
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: <Widget>[
        Container(
           child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: Text("Sélectionner", style: TextStyle(color: Colors.deepPurple.shade300),),
            searchHint: "Sélectionner",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                StudiesPicker.listValues.forEach((k,v) => {
                if(selectedValue == v) { selectedValueDropDown = k }
                });              
              });    
              final nscSelectorBloc = BlocProvider.of<NscSelectorBloc>(ctx);
              nscSelectorBloc.add(GetNumberOfYearsOfStudies(selectedValueDropDown));          
            },
            isExpanded: true,
          ),   
        )],
    );
  }
}