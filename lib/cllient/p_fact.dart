import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PFactPage extends StatefulWidget {
  const PFactPage({super.key});

  @override
  State<PFactPage> createState() => _PFactPageState();
}

class _PFactPageState extends State<PFactPage> {

  TextEditingController cardNbCntr = TextEditingController();
  
  void getCardTypeFrmNum(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('New card',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child: Column(
            children: [
              const Spacer(),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(20),
                        CardNumberInput(),
                      ],
                      decoration: InputDecoration(
                        hintText: "Card number",
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.card_membership_rounded),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
    
                      ),
                      
                    ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nom",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.person_2_outlined),
                          ),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        ),
                      ),
                    ),
                    Row(
                      children:  [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                              FilteringTextInputFormatter.digitsOnly,
                              
                            ],
                            decoration: InputDecoration(
                              hintText: "CVV",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.cabin_outlined),
                              ),
                              border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                              FilteringTextInputFormatter.digitsOnly,
                              CardMonthInputForm(),
                            ],
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.date_range),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      
              const Spacer(flex: 2),
              //Scan Button
              OutlinedButton.icon(
                icon: const Icon(Icons.qr_code_2),
                label: const Text('Scan'),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text('Add Card'),
                  onPressed: () {},
                ),
              ),      
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInput extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}



class CardMonthInputForm extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if(newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();

    for(var i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;

      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write("/");
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}