// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/05-01-P05TABLESERVICEGETDATA.dart';
import 'P5TABLESERVICE/P05TABLESERVICEMAIN.dart';

//---------------------------------------------------------

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5blockget();
  }
}

class Page5blockget extends StatelessWidget {
  const Page5blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P05TABLESERVICEGETDATA_Bloc(),
        child: BlocBuilder<P05TABLESERVICEGETDATA_Bloc,
            List<P05TABLESERVICEGETDATAclass>>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({
    super.key,
    this.data,
  });
  List<P05TABLESERVICEGETDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P05TABLESERVICEMAIN(
      data: data,
    );
  }
}
