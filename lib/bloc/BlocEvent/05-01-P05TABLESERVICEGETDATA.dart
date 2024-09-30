import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/dummydata2.dart';
import '../../page/P5TABLESERVICE/P05TABLESERVICEMAIN.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P05TABLESERVICEGETDATA_Event {}

class P05TABLESERVICEGETDATA_GET extends P05TABLESERVICEGETDATA_Event {}

class P05TABLESERVICEGETDATA_GET2 extends P05TABLESERVICEGETDATA_Event {}

class P05TABLESERVICEGETDATA_GET3 extends P05TABLESERVICEGETDATA_Event {}

class P05TABLESERVICEGETDATA_FLUSH extends P05TABLESERVICEGETDATA_Event {}

class P05TABLESERVICEGETDATA_Bloc extends Bloc<P05TABLESERVICEGETDATA_Event,
    List<P05TABLESERVICEGETDATAclass>> {
  P05TABLESERVICEGETDATA_Bloc() : super([]) {
    on<P05TABLESERVICEGETDATA_GET>((event, emit) {
      return _P05TABLESERVICEGETDATA_GET([], emit);
    });

    on<P05TABLESERVICEGETDATA_GET2>((event, emit) {
      return _P05TABLESERVICEGETDATA_GET2([], emit);
    });
    on<P05TABLESERVICEGETDATA_GET3>((event, emit) {
      return _P05TABLESERVICEGETDATA_GET3([], emit);
    });
    on<P05TABLESERVICEGETDATA_FLUSH>((event, emit) {
      return _P05TABLESERVICEGETDATA_FLUSH([], emit);
    });
  }

  Future<void> _P05TABLESERVICEGETDATA_GET(
      List<P05TABLESERVICEGETDATAclass> toAdd,
      Emitter<List<P05TABLESERVICEGETDATAclass>> emit) async {
    FreeLoadingTan(P05TABLESERVICEMAINcontext);
    List<P05TABLESERVICEGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    var input = dummydatainput6;

    List<P05TABLESERVICEGETDATAclass> outputdata = input.map((data) {
      return P05TABLESERVICEGETDATAclass(
        TYPE: savenull(data['type']),
        MKTGROUP: savenull(data['mktgroup']),
        GROUP: savenull(data['group']),
        CUSTOMER: savenull(data['customer']),
        FREQUENCY: savenull(data['frequency']),
        INCHARGE: savenull(data['incharge']),
        KPISERV: savenull(data['kpi serv']),
        KPIPERIOD: savenull(data['kpi period']),
        REPITEM: savenull(data['repitems']),
        MONTH: savenull(data['month']),
        YEAR: savenull(data['year']),
        FREQ1: savenull(data['freq1']),
        PLANSAM1: formatDate(savenull(data['plan sam1'])),
        ACTSAM1: formatDate(savenull(data['act sam1'])),
        REPDUE1: formatDate(savenull(data['rep due1'])),
        SENTREP1: formatDate(savenull(data['sent rep1'])),
        REPDAYS1: savenull(data['rep days1']),
        FREQ2: savenull(data['freq2']),
        PLANSAM2: formatDate(savenull(data['plan sam2'])),
        ACTSAM2: formatDate(savenull(data['act sam2'])),
        REPDUE2: formatDate(savenull(data['rep due2'])),
        SENTREP2: formatDate(savenull(data['sent rep2'])),
        REPDAYS2: savenull(data['rep days2']),
        FREQ3: savenull(data['freq3']),
        PLANSAM3: formatDate(savenull(data['plan sam3'])),
        ACTSAM3: formatDate(savenull(data['act sam3'])),
        REPDUE3: formatDate(savenull(data['rep due3'])),
        SENTREP3: formatDate(savenull(data['sent rep3'])),
        REPDAYS3: savenull(data['rep days3']),
        FREQ4: savenull(data['freq4']),
        PLANSAM4: formatDate(savenull(data['plan sam4'])),
        ACTSAM4: formatDate(savenull(data['act sam4'])),
        REPDUE4: formatDate(savenull(data['rep due4'])),
        SENTREP4: formatDate(savenull(data['sent rep4'])),
        REPDAYS4: savenull(data['rep days4']),
      );
    }).toList();
    // print(outputdata);
    Navigator.pop(P05TABLESERVICEMAINcontext);
    output = outputdata;
    emit(output);
  }

  Future<void> _P05TABLESERVICEGETDATA_GET2(
      List<P05TABLESERVICEGETDATAclass> toAdd,
      Emitter<List<P05TABLESERVICEGETDATAclass>> emit) async {
    // List<P05TABLESERVICEGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // var input = dummydatainput2;

    // List<P05TABLESERVICEGETDATAclass> outputdata = input
    //     .where((data) =>
    //         data['location'] == 'ESIE1' &&
    //         data['plant'] == 'YES' &&
    //         data['step01'] == 'YES')
    //     .map((data) {
    //   return P05TABLESERVICEGETDATAclass(
    //     PLANT: savenull(data['plant']),
    //     ORDER: savenull(data['order']),
    //     MAT: savenull(data['mat']),
    //     LOCATION: savenull(data['location']),
    //     LOT: savenull(data['lot']),
    //     CUSTOMER: savenull(data['customer']),
    //     PARTNO: savenull(data['partno']),
    //     PARTNAME: savenull(data['partname']),
    //     STEP01: savenull(data['step1']),
    //     STEP02: savenull(data['step2']),
    //     STEP03: savenull(data['step3']),
    //     STEP04: savenull(data['step4']),
    //     STEP05: savenull(data['step5']),
    //     STEP06: savenull(data['step6']),
    //     STEP07: savenull(data['step7']),
    //     STEP08: savenull(data['step8']),
    //     STEP09: savenull(data['step9']),
    //   );
    // }).toList();

    // output = outputdata;
    // emit(output);
  }

  Future<void> _P05TABLESERVICEGETDATA_GET3(
      List<P05TABLESERVICEGETDATAclass> toAdd,
      Emitter<List<P05TABLESERVICEGETDATAclass>> emit) async {
    // List<P05TABLESERVICEGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P05TABLESERVICEGETDATAclass> datadummy = [
    //   P05TABLESERVICEGETDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P05TABLESERVICEGETDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P05TABLESERVICEGETDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P05TABLESERVICEGETDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P05TABLESERVICEGETDATA_FLUSH(
      List<P05TABLESERVICEGETDATAclass> toAdd,
      Emitter<List<P05TABLESERVICEGETDATAclass>> emit) async {
    List<P05TABLESERVICEGETDATAclass> output = [];
    emit(output);
  }
}

class P05TABLESERVICEGETDATAclass {
  P05TABLESERVICEGETDATAclass({
    this.TYPE = '',
    this.MKTGROUP = '',
    this.GROUP = '',
    this.CUSTOMER = '',
    this.FREQUENCY = '',
    this.INCHARGE = '',
    this.KPISERV = '',
    this.KPIPERIOD = '',
    this.REPITEM = '',
    this.MONTH = '',
    this.YEAR = '',
    this.FREQ1 = '',
    this.PLANSAM1 = '',
    this.ACTSAM1 = '',
    this.REPDUE1 = '',
    this.SENTREP1 = '',
    this.REPDAYS1 = '',
    this.FREQ2 = '',
    this.PLANSAM2 = '',
    this.ACTSAM2 = '',
    this.REPDUE2 = '',
    this.SENTREP2 = '',
    this.REPDAYS2 = '',
    this.FREQ3 = '',
    this.PLANSAM3 = '',
    this.ACTSAM3 = '',
    this.REPDUE3 = '',
    this.SENTREP3 = '',
    this.REPDAYS3 = '',
    this.FREQ4 = '',
    this.PLANSAM4 = '',
    this.ACTSAM4 = '',
    this.REPDUE4 = '',
    this.SENTREP4 = '',
    this.REPDAYS4 = '',
  });

  String TYPE;
  String MKTGROUP;
  String GROUP;
  String CUSTOMER;
  String FREQUENCY;
  String INCHARGE;
  String KPISERV;
  String KPIPERIOD;
  String REPITEM;
  String MONTH;
  String YEAR;
  String FREQ1;
  String PLANSAM1;
  String ACTSAM1;
  String REPDUE1;
  String SENTREP1;
  String REPDAYS1;
  String FREQ2;
  String PLANSAM2;
  String ACTSAM2;
  String REPDUE2;
  String SENTREP2;
  String REPDAYS2;
  String FREQ3;
  String PLANSAM3;
  String ACTSAM3;
  String REPDUE3;
  String SENTREP3;
  String REPDAYS3;
  String FREQ4;
  String PLANSAM4;
  String ACTSAM4;
  String REPDUE4;
  String SENTREP4;
  String REPDAYS4;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}

String formatDate(String? date) {
  if (date == null || date.isEmpty) return '';
  try {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('dd-MMM').format(parsedDate);
  } catch (e) {
    return '';
  }
}
