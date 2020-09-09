import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;
  AdaptativeDatePicker({this.selectedDate, this.onDateChange});

  _showDatePicker(BuildContext context) {
    showDatePicker(
            //Context recebido por herança
            context: context,
            initialDate: DateTime.now(),
            //Data mais antiga que o usuario pode selecionar
            firstDate: DateTime(2019),
            //Data atual é a data limite, não pode selecionar data no futuro
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      //Comunicação indireta
      onDateChange(value);
    });
    //locale: const Locale('pt', 'BR'));
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada ${DateFormat(
                            'dd/MM/yyyy',
                          ).format(selectedDate)}',
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}
