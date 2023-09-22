import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagrPickerScreen(),
    );
  }
}

class ImagrPickerScreen extends StatefulWidget {
  const ImagrPickerScreen({super.key});

  @override
  State<ImagrPickerScreen> createState() => _ImagrPickerScreenState();
}

class _ImagrPickerScreenState extends State<ImagrPickerScreen> {
   File? image;
   ImagePicker? imagePicker = ImagePicker();

   uploadImage()async{

     var chooseImage =await imagePicker!.pickImage(source: ImageSource.camera);
     if(chooseImage !=null)
       {
         setState(() {
           image = File(chooseImage.path);
         });
       }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            image == null ?Text("No Image"):Image.file(image!,width: 200,height: 200,fit: BoxFit.cover,),
            ElevatedButton(
              onPressed: ()async{
                await uploadImage();
              },
              child: Text("pick image"),
            ),
          ],
        ),
      ),
    );
  }
}


