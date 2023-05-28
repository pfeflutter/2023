import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welapp/cllient/mes_fact.dart';
import 'package:intl/intl.dart';

class PFactPage extends StatefulWidget {
  DocumentSnapshot docid;
  PFactPage({required this.docid});

  @override
  State<PFactPage> createState() => _PFactPageState();
}

class _PFactPageState extends State<PFactPage> {
  final now = DateTime.now();
  TextEditingController cardNbCntr = TextEditingController();
  
  void getCardTypeFrmNum(){
    
  }
  var  nCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool condition = widget.docid['paye'];
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.amber,
        foregroundColor: Colors.black,
        title: const Text('PAIEMENT DE FACTURE',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //       onPressed: () {
        //       // Do something
        //     },
        //     color: Colors.black,
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: Column(
            children: [
              //const Spacer(),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nom Facture :       ${widget.docid['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Date :       ${widget.docid['date']}',
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Montant Total :       ${widget.docid['price']} MAD',
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(20),
                        CardNumberInput(),
                      ],
                      decoration: InputDecoration(
                        hintText: condition ? widget.docid['NCard'] : "Numéro de carte",
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.card_membership_rounded),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
    
                      ),
                      controller: nCardController,
                    ),
                    // Padding(
                    //   padding:  const EdgeInsets.symmetric(vertical: 20),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       hintText: "Nom",
                    //       prefixIcon: Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 10),
                    //         child: Icon(Icons.person_2_outlined),
                    //       ),
                    //       border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       borderSide: BorderSide(color: Colors.grey),
                    //     ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20,),
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
              // OutlinedButton.icon(
              //   icon: const Icon(Icons.qr_code_2),
              //   label: const Text('Scan'),
              //   onPressed: () {},
              // ),
              Padding(
                padding: const EdgeInsets.only(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  //primary: const Color.fromARGB(255, 121, 64, 195),
                   primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.fromLTRB(80,10,80,10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                  child: const Text('Confirmer'),
                  onPressed: () {
                    widget.docid.reference.update({
                    //'updatedAt': FieldValue.serverTimestamp(),
                      'updatedAt': formattedDate,
                      'pname' : 'Payée',
                      'paye'  : true,
                      'NCard' : nCardController.text,
                    }).whenComplete(() {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> MesFactureCl()));
                    });
                  },
                ),
                
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.cancel),
                label: const Text('Annule'),
                onPressed: () {
                  widget.docid.reference.update({
                    //'updatedAt': FieldValue.serverTimestamp(),
                      'updatedAt': formattedDate,
                      'pname' : 'Payer',
                      'paye'  : false,
                      'NCard' : '',
                    }).whenComplete(() {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> MesFactureCl()));
                    });
                },
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