import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

mostrarSnackBar
 (
    {
      required BuildContext context, required String texto, bool isErro = true
    }
  )
{
  //ciclo de cadastro numa snackbar
  SnackBar snackBar = SnackBar
  (
    content: Text(texto),
    backgroundColor: (isErro) ? Colors.red :Colors.green,
    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),

    duration:const Duration(seconds: 5),
    action: SnackBarAction
    (
      label: "OK",textColor: Colors.white,
      onPressed: ()
      {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
    showCloseIcon: true,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}