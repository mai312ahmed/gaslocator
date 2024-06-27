import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class GeneralButtonm extends StatelessWidget {
  const GeneralButtonm({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,

        //() async {
        //  showloading(context);
        //  var formdata = formstate.currentState;
        // if(formdata!.validate()){
        //  formdata.save();
        //    print("valid");

        //  try {
        //    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //        email: myemail,
        //        password: mypassword);
        //    if(userCredential.user!.emailVerified == false){
        //    User? user = FirebaseAuth.instance.currentUser;
        //    await user!.sendEmailVerification();}
        //    await adddata();
        //    Navigator.of(context).pop();
        //    showDialog(context: context, builder: (context){
        //      return  AlertDialog(
        //        title:Text("^_^"),
        //        content: Text("done"),
        //      );});
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return Login();}));
        //    }
        //  on FirebaseAuthException catch (e) {
        //    if (e.code == 'email-already-in-use') {
        //      Navigator.of(context).pop();
        //    showDialog(context: context, builder: (context){
        //      return const AlertDialog(
        //        title:Text("error"),
        //        content: Text("The account already exists for that email."),
        //      );});

        //  }

        //    else  if (e.code == 'weak-password') {
        //      Navigator.of(context).pop();
        //      showDialog(context: context, builder: (context){
        //    return const AlertDialog(
        //      title:Text("error"),
        //      content: Text("The password provided is too weak."),
        //    );});

        //  }
        //  } catch (e) {
        //    Navigator.of(context).pop();
        //    showDialog(context: context, builder: (context){
        //      return AlertDialog(
        //        title:const Text("error"),
        //        content: Text("$e"),
        //      );});

        //  }

        // }
        //  else {print("not valid");}

        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.orange,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.6),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 6),
                  )
                ]),
            child: Center(
              child: Text(text,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            )));
  }
}

class GeneralButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const GeneralButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
      ),
      onPressed: onTap,
      child: Text(text,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600)),
    );
  }
}
