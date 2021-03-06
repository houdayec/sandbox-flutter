import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:melissapp/birthdate_calculator/bloc/birthdate_bloc.dart';


class BirthdateSelector extends StatelessWidget {
  
  Column buildColumnWithAge(BuildContext context, String age){
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text(age, style: Theme.of(context).textTheme.body1,), 
        onPressed: () {
          DatePickerWidget();
        },)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             AutoSizeText("Date de naissance",
             maxLines: 1,
             style: Theme.of(context).textTheme.title,),
             DatePickerWidget(),
             BlocBuilder<BirthdateBloc, BirthdateState>(
               builder: (BuildContext context, BirthdateState state) {
                  if(state is BirthdateInitial){
                    return Text("Pas de date sélectionnée");
                  }else if(state is AgeComputed){
                    return buildColumnWithAge(context, state.computedAge);
                  } else {
                    return Text("Pas de date sélectionnée", style: Theme.of(context).textTheme.title,);
                  }
               },
             ),
           ],
         ),
       ),
    );
  }
}
const String MIN_DATETIME = '1920-05-12';
const String MAX_DATETIME = '1965-11-25';
const String INIT_DATETIME = '1940-04-17';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({Key key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {

  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MMMM-dd';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
       child: Column(
         children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: FlatButton(
                color: Colors.deepPurple,
                child: Text("Choisir une date de naissance", style: TextStyle(color: Colors.white)), 
              onPressed: () {
                _showDatePicker(context);
              },),
            ),  
          ],
       ),
    );
  }

  /// Display date picker.
  void _showDatePicker(BuildContext ctx) {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('Valider', style: TextStyle(color: Colors.green)),
        cancel: Text('Annuler', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;    
        });
        final birthdateBloc = BlocProvider.of<BirthdateBloc>(ctx);
        birthdateBloc.add(GetAge(dateTime));
      },
    );
  }
}
