import 'package:flutter/material.dart';

class GuestInputDialog extends StatefulWidget {
  @override
  _GuestInputDialogState createState() => _GuestInputDialogState();
}

class _GuestInputDialogState extends State<GuestInputDialog> {
  int _adults = 1;
  int _children = 0;
  int _infants = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Guest'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildGuestRow('Adults', _adults, () => _incrementGuest('adults'), () => _decrementGuest('adults')),
          _buildGuestRow('Children', _children, () => _incrementGuest('children'), () => _decrementGuest('children')),
          _buildGuestRow('Infants', _infants, () => _incrementGuest('infants'), () => _decrementGuest('infants', canBeZero: false)),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({'adults': _adults, 'children': _children, 'infants': _infants});
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }

  Widget _buildGuestRow(String label, int count, Function() onIncrement, Function() onDecrement) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: Icon(Icons.remove),
            ),
            Text('$count'),
            IconButton(
              onPressed: onIncrement,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  void _incrementGuest(String type) {
    setState(() {
      if (type == 'adults') {
        _adults++;
      } else if (type == 'children') {
        _children++;
      } else if (type == 'infants') {
        _infants++;
      }
    });
  }

  void _decrementGuest(String type, {bool canBeZero = true}) {
    setState(() {
      if (type == 'adults') {
        if (_adults > 1) {
          _adults--;
        }
      } else if (type == 'children') {
        if (_children > 0) {
          _children--;
        }
      } else if (type == 'infants') {
        if (_infants > (canBeZero ? 0 : 1)) {
          _infants--;
        }
      }
    });
  }
}
