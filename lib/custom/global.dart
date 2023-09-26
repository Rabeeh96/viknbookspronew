import 'package:flutter/src/painting/text_style.dart';

import 'package:google_fonts/google_fonts.dart';

customisedStyleBold(context,clr,fontWeight,fontSize){
  return GoogleFonts.poppins(textStyle:TextStyle(fontWeight: fontWeight,color: clr,fontSize: fontSize));
}
