import 'package:flutter/material.dart';

class from_text extends StatefulWidget {
  const from_text({super.key});

  @override
  State<from_text> createState() => _from_textState();
}

class _from_textState extends State<from_text> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;

  final FocusNode _nameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Lắng nghe sự kiện thay đổi tiêu điểm
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        print('Name field is focused');
      } else {
        print('Name field is unfocused');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            focusNode: _nameFocusNode,
            decoration: InputDecoration(
              icon: Icon(Icons.abc),
              labelText: "email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // Kiểm tra định dạng email
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onSaved: (value) {
              _email = value;
            },
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              cursorRadius: Radius.circular(20),
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Do something with the input data
                print('Name: $_name');
                print('Email: $_email');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
