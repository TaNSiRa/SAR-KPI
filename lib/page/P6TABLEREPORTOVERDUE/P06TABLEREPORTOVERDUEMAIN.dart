// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, file_names, no_leading_underscores_for_local_identifiers
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/06-01-P06TABLEREPORTOVERDUEGETDATA.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputTextTan.dart';
import 'P06TABLEREPORTOVERDUEVAR.dart';

late BuildContext P06TABLEREPORTOVERDUEMAINcontext;
ScrollController _controllerIN01 = ScrollController();

class P06TABLEREPORTOVERDUEMAIN extends StatefulWidget {
  P06TABLEREPORTOVERDUEMAIN({
    super.key,
    this.data,
  });
  List<P06TABLEREPORTOVERDUEGETDATAclass>? data;

  @override
  State<P06TABLEREPORTOVERDUEMAIN> createState() =>
      _P06TABLEREPORTOVERDUEMAINState();
}

class _P06TABLEREPORTOVERDUEMAINState extends State<P06TABLEREPORTOVERDUEMAIN> {
  @override
  void initState() {
    super.initState();
    context
        .read<P06TABLEREPORTOVERDUEGETDATA_Bloc>()
        .add(P06TABLEREPORTOVERDUEGETDATA_GET());
  }

  @override
  Widget build(BuildContext context) {
    P06TABLEREPORTOVERDUEMAINcontext = context;
    List<P06TABLEREPORTOVERDUEGETDATAclass> _datain = widget.data ?? [];

// ตัวแปรสําหรับใช้กับ Dropdown
    final selectedGroup = (P06TABLEREPORTOVERDUEVAR.DropDownGroup.isNotEmpty)
        ? P06TABLEREPORTOVERDUEVAR.DropDownGroup
        : '1';
    final selectedYear = (P06TABLEREPORTOVERDUEVAR.DropDownYear.isNotEmpty)
        ? P06TABLEREPORTOVERDUEVAR.DropDownYear
        : P06TABLEREPORTOVERDUEVAR.currentYear;
    final selectedMonth = (P06TABLEREPORTOVERDUEVAR.DropDownMonth.isNotEmpty)
        ? P06TABLEREPORTOVERDUEVAR.DropDownMonth
        : P06TABLEREPORTOVERDUEVAR.currentMonth;

// กรองข้อมูลด้วยปีและเดือน
    List<P06TABLEREPORTOVERDUEGETDATAclass> filteredData =
        _datain.where((data) {
      return data.MKTGROUP == selectedGroup &&
          data.YEAR == selectedYear &&
          data.MONTH == selectedMonth;
    }).toList();

// กรองข้อมูลในตารางด้วยการค้นหา
    List<P06TABLEREPORTOVERDUEGETDATAclass> _datasearch = [];
    _datasearch.addAll(
      filteredData.where(
        (data) =>
            data.TYPE.toLowerCase().contains(P06TABLEREPORTOVERDUEVAR.SEARCH) ||
            data.GROUP
                .toLowerCase()
                .contains(P06TABLEREPORTOVERDUEVAR.SEARCH) ||
            data.CUSTOMER
                .toLowerCase()
                .contains(P06TABLEREPORTOVERDUEVAR.SEARCH) ||
            data.INCHARGE
                .toLowerCase()
                .contains(P06TABLEREPORTOVERDUEVAR.SEARCH),
      ),
    );

// เรียงชุดข้อมูลตาม TYPE,GROUP,CUSTOMER
    _datasearch.sort((a, b) {
      int typeComparison = a.TYPE.compareTo(b.TYPE);
      if (typeComparison != 0) {
        return typeComparison;
      }

      int groupComparison = a.GROUP.compareTo(b.GROUP);
      if (groupComparison != 0) {
        return groupComparison;
      }

      return a.CUSTOMER.compareTo(b.CUSTOMER);
    });

//แยกข้อมูล week 1-4
    List<Map<String, String>> newData = [];
    for (var data in _datasearch) {
      if (data.REPDAYS1.isNotEmpty &&
          data.KPIPERIOD.isNotEmpty &&
          int.tryParse(data.REPDAYS1)! > int.tryParse(data.KPIPERIOD)!) {
        Map<String, String> transformedData1 = {
          'type': data.TYPE,
          'mktgroup': data.MKTGROUP,
          'group': data.GROUP,
          'customer': data.CUSTOMER,
          'frequency': data.FREQUENCY,
          'incharge': data.INCHARGE,
          'kpi serv': data.KPISERV,
          'kpi period': data.KPIPERIOD,
          'repitems': data.REPITEM,
          'month': data.MONTH,
          'year': data.YEAR,
          'freq': data.FREQ1,
          'plan sam': data.PLANSAM1,
          'act sam': data.ACTSAM1,
          'rep due': data.REPDUE1,
          'sent rep': data.SENTREP1,
          'rep days': data.REPDAYS1,
          'request': data.REQUEST1,
          'ttcresult': data.TTCRESULT1,
          'issuedate': data.ISSUEDATE1,
          'sublead': data.SUBLEAD1,
          'gl': data.GL1,
          'mgr': data.MGR1,
          'jp': data.JP1,
          'revise1': data.REVISE1_1,
          'sublead1': data.SUBLEAD1_1,
          'gl1': data.GL1_1,
          'mgr1': data.MGR1_1,
          'jp1': data.JP1_1,
          'revise2': data.REVISE1_2,
          'sublead2': data.SUBLEAD1_1,
          'gl2': data.GL1_2,
          'mgr2': data.MGR1_2,
          'jp2': data.JP1_2,
          'revise3': data.REVISE1_3,
          'sublead3': data.SUBLEAD1_3,
          'gl3': data.GL1_3,
          'mgr3': data.MGR1_3,
          'jp3': data.JP1_3,
          'bdprepare': data.BDPREPARE1,
          'bdttc': data.BDTTC1,
          'bdissue': data.BDISSUE1,
          'bdsublead': data.BDSUBLEAD1,
          'bdgl': data.BDGL1,
          'bdmgr': data.BDMGR1,
          'bdjp': data.BDJP1,
          'bdrevise1': data.BDREVISE1_1,
          'bdsublead1': data.BDSUBLEAD1_1,
          'bdgl1': data.BDGL1_1,
          'bdmgr1': data.BDMGR1_1,
          'bdjp1': data.BDJP1_1,
          'bdrevise2': data.BDREVISE1_2,
          'bdsublead2': data.BDSUBLEAD1_2,
          'bdgl2': data.BDGL1_2,
          'bdmgr2': data.BDMGR1_2,
          'bdjp2': data.BDJP1_2,
          'bdrevise3': data.BDREVISE1_3,
          'bdsublead3': data.BDSUBLEAD1_3,
          'bdgl3': data.BDGL1_3,
          'bdmgr3': data.BDMGR1_3,
          'bdjp3': data.BDJP1_3,
          'bdsent': data.BDSENT1,
          'reason': data.REASON1,
        };
        newData.add(transformedData1);
      }
      if (data.REPDAYS2.isNotEmpty &&
          data.KPIPERIOD.isNotEmpty &&
          int.tryParse(data.REPDAYS2)! > int.tryParse(data.KPIPERIOD)!) {
        Map<String, String> transformedData1 = {
          'type': data.TYPE,
          'mktgroup': data.MKTGROUP,
          'group': data.GROUP,
          'customer': data.CUSTOMER,
          'frequency': data.FREQUENCY,
          'incharge': data.INCHARGE,
          'kpi serv': data.KPISERV,
          'kpi period': data.KPIPERIOD,
          'repitems': data.REPITEM,
          'month': data.MONTH,
          'year': data.YEAR,
          'freq': data.FREQ2,
          'plan sam': data.PLANSAM2,
          'act sam': data.ACTSAM2,
          'rep due': data.REPDUE2,
          'sent rep': data.SENTREP2,
          'rep days': data.REPDAYS2,
          'request': data.REQUEST2,
          'ttcresult': data.TTCRESULT2,
          'issuedate': data.ISSUEDATE2,
          'sublead': data.SUBLEAD2,
          'gl': data.GL2,
          'mgr': data.MGR2,
          'jp': data.JP2,
          'revise1': data.REVISE2_1,
          'sublead1': data.SUBLEAD2_1,
          'gl1': data.GL2_1,
          'mgr1': data.MGR2_1,
          'jp1': data.JP2_1,
          'revise2': data.REVISE2_2,
          'sublead2': data.SUBLEAD2_1,
          'gl2': data.GL2_2,
          'mgr2': data.MGR2_2,
          'jp2': data.JP2_2,
          'revise3': data.REVISE2_3,
          'sublead3': data.SUBLEAD2_3,
          'gl3': data.GL2_3,
          'mgr3': data.MGR2_3,
          'jp3': data.JP2_3,
          'bdprepare': data.BDPREPARE2,
          'bdttc': data.BDTTC2,
          'bdissue': data.BDISSUE2,
          'bdsublead': data.BDSUBLEAD2,
          'bdgl': data.BDGL2,
          'bdmgr': data.BDMGR2,
          'bdjp': data.BDJP2,
          'bdrevise1': data.BDREVISE2_1,
          'bdsublead1': data.BDSUBLEAD2_1,
          'bdgl1': data.BDGL2_1,
          'bdmgr1': data.BDMGR2_1,
          'bdjp1': data.BDJP2_1,
          'bdrevise2': data.BDREVISE2_2,
          'bdsublead2': data.BDSUBLEAD2_2,
          'bdgl2': data.BDGL2_2,
          'bdmgr2': data.BDMGR2_2,
          'bdjp2': data.BDJP2_2,
          'bdrevise3': data.BDREVISE2_3,
          'bdsublead3': data.BDSUBLEAD2_3,
          'bdgl3': data.BDGL2_3,
          'bdmgr3': data.BDMGR2_3,
          'bdjp3': data.BDJP2_3,
          'bdsent': data.BDSENT2,
          'reason': data.REASON2,
        };
        newData.add(transformedData1);
      }
      if (data.REPDAYS3.isNotEmpty &&
          data.KPIPERIOD.isNotEmpty &&
          int.tryParse(data.REPDAYS3)! > int.tryParse(data.KPIPERIOD)!) {
        Map<String, String> transformedData1 = {
          'type': data.TYPE,
          'mktgroup': data.MKTGROUP,
          'group': data.GROUP,
          'customer': data.CUSTOMER,
          'frequency': data.FREQUENCY,
          'incharge': data.INCHARGE,
          'kpi serv': data.KPISERV,
          'kpi period': data.KPIPERIOD,
          'repitems': data.REPITEM,
          'month': data.MONTH,
          'year': data.YEAR,
          'freq': data.FREQ3,
          'plan sam': data.PLANSAM3,
          'act sam': data.ACTSAM3,
          'rep due': data.REPDUE3,
          'sent rep': data.SENTREP3,
          'rep days': data.REPDAYS3,
          'request': data.REQUEST3,
          'ttcresult': data.TTCRESULT3,
          'issuedate': data.ISSUEDATE3,
          'sublead': data.SUBLEAD3,
          'gl': data.GL3,
          'mgr': data.MGR3,
          'jp': data.JP3,
          'revise1': data.REVISE3_1,
          'sublead1': data.SUBLEAD3_1,
          'gl1': data.GL3_1,
          'mgr1': data.MGR3_1,
          'jp1': data.JP3_1,
          'revise2': data.REVISE3_2,
          'sublead2': data.SUBLEAD3_1,
          'gl2': data.GL3_2,
          'mgr2': data.MGR3_2,
          'jp2': data.JP3_2,
          'revise3': data.REVISE3_3,
          'sublead3': data.SUBLEAD3_3,
          'gl3': data.GL3_3,
          'mgr3': data.MGR3_3,
          'jp3': data.JP3_3,
          'bdprepare': data.BDPREPARE3,
          'bdttc': data.BDTTC3,
          'bdissue': data.BDISSUE3,
          'bdsublead': data.BDSUBLEAD3,
          'bdgl': data.BDGL3,
          'bdmgr': data.BDMGR3,
          'bdjp': data.BDJP3,
          'bdrevise1': data.BDREVISE3_1,
          'bdsublead1': data.BDSUBLEAD3_1,
          'bdgl1': data.BDGL3_1,
          'bdmgr1': data.BDMGR3_1,
          'bdjp1': data.BDJP3_1,
          'bdrevise2': data.BDREVISE3_2,
          'bdsublead2': data.BDSUBLEAD3_2,
          'bdgl2': data.BDGL3_2,
          'bdmgr2': data.BDMGR3_2,
          'bdjp2': data.BDJP3_2,
          'bdrevise3': data.BDREVISE3_3,
          'bdsublead3': data.BDSUBLEAD3_3,
          'bdgl3': data.BDGL3_3,
          'bdmgr3': data.BDMGR3_3,
          'bdjp3': data.BDJP3_3,
          'bdsent': data.BDSENT3,
          'reason': data.REASON3,
        };
        newData.add(transformedData1);
      }
      if (data.REPDAYS4.isNotEmpty &&
          data.KPIPERIOD.isNotEmpty &&
          int.tryParse(data.REPDAYS4)! > int.tryParse(data.KPIPERIOD)!) {
        Map<String, String> transformedData1 = {
          'type': data.TYPE,
          'mktgroup': data.MKTGROUP,
          'group': data.GROUP,
          'customer': data.CUSTOMER,
          'frequency': data.FREQUENCY,
          'incharge': data.INCHARGE,
          'kpi serv': data.KPISERV,
          'kpi period': data.KPIPERIOD,
          'repitems': data.REPITEM,
          'month': data.MONTH,
          'year': data.YEAR,
          'freq': data.FREQ4,
          'plan sam': data.PLANSAM4,
          'act sam': data.ACTSAM4,
          'rep due': data.REPDUE4,
          'sent rep': data.SENTREP4,
          'rep days': data.REPDAYS4,
          'request': data.REQUEST4,
          'ttcresult': data.TTCRESULT4,
          'issuedate': data.ISSUEDATE4,
          'sublead': data.SUBLEAD4,
          'gl': data.GL4,
          'mgr': data.MGR4,
          'jp': data.JP4,
          'revise1': data.REVISE4_1,
          'sublead1': data.SUBLEAD4_1,
          'gl1': data.GL4_1,
          'mgr1': data.MGR4_1,
          'jp1': data.JP4_1,
          'revise2': data.REVISE4_2,
          'sublead2': data.SUBLEAD4_1,
          'gl2': data.GL4_2,
          'mgr2': data.MGR4_2,
          'jp2': data.JP4_2,
          'revise3': data.REVISE4_3,
          'sublead3': data.SUBLEAD4_3,
          'gl3': data.GL4_3,
          'mgr3': data.MGR4_3,
          'jp3': data.JP4_3,
          'bdprepare': data.BDPREPARE4,
          'bdttc': data.BDTTC4,
          'bdissue': data.BDISSUE4,
          'bdsublead': data.BDSUBLEAD4,
          'bdgl': data.BDGL4,
          'bdmgr': data.BDMGR4,
          'bdjp': data.BDJP4,
          'bdrevise1': data.BDREVISE4_1,
          'bdsublead1': data.BDSUBLEAD4_1,
          'bdgl1': data.BDGL4_1,
          'bdmgr1': data.BDMGR4_1,
          'bdjp1': data.BDJP4_1,
          'bdrevise2': data.BDREVISE4_2,
          'bdsublead2': data.BDSUBLEAD4_2,
          'bdgl2': data.BDGL4_2,
          'bdmgr2': data.BDMGR4_2,
          'bdjp2': data.BDJP4_2,
          'bdrevise3': data.BDREVISE4_3,
          'bdsublead3': data.BDSUBLEAD4_3,
          'bdgl3': data.BDGL4_3,
          'bdmgr3': data.BDMGR4_3,
          'bdjp3': data.BDJP4_3,
          'bdsent': data.BDSENT4,
          'reason': data.REASON4,
        };
        newData.add(transformedData1);
      }
    }

// นับจำนวนข้อมูล
    int groupADataCount =
        newData.where((item) => item['type'] == 'Group A').length;
    int groupBDataCount =
        newData.where((item) => item['type'] == 'Group B').length;

    return Scrollbar(
      controller: _controllerIN01,
      thumbVisibility: true,
      interactive: true,
      thickness: 10,
      radius: Radius.circular(20),
      child: SingleChildScrollView(
        controller: _controllerIN01,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: const [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'SAR : Report over due Group $selectedGroup ($selectedMonth $selectedYear)',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ComInputTextTan(
                    sPlaceholder: "Search... (Type, Group, Customer ,Incharge)",
                    isSideIcon: false,
                    height: 30,
                    width: 400,
                    isContr: P06TABLEREPORTOVERDUEVAR.iscontrol,
                    fnContr: (input) {
                      P06TABLEREPORTOVERDUEVAR.iscontrol = input;
                    },
                    sValue: P06TABLEREPORTOVERDUEVAR.SEARCH,
                    returnfunc: (String s) {
                      setState(() {
                        P06TABLEREPORTOVERDUEVAR.SEARCH = s;
                      });
                    },
                  ),
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        P06TABLEREPORTOVERDUEVAR.isHoveredClear = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        P06TABLEREPORTOVERDUEVAR.isHoveredClear = false;
                      });
                    },
                    child: InkWell(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      onTap: () {
                        setState(() {
                          P06TABLEREPORTOVERDUEVAR.isHoveredClear = false;
                          P06TABLEREPORTOVERDUEVAR.iscontrol = true;
                          P06TABLEREPORTOVERDUEVAR.SEARCH = '';
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: P06TABLEREPORTOVERDUEVAR.isHoveredClear
                                ? Colors.yellowAccent.shade700
                                : Colors.redAccent.shade700,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: const [
                                  Colors.white,
                                  Colors.red,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds),
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                  begin: P06TABLEREPORTOVERDUEVAR.isHoveredClear
                                      ? 8
                                      : 8,
                                  end: P06TABLEREPORTOVERDUEVAR.isHoveredClear
                                      ? 8
                                      : 8,
                                ),
                                duration: Duration(milliseconds: 200),
                                builder: (context, size, child) {
                                  return TweenAnimationBuilder<Color?>(
                                    tween: ColorTween(
                                      begin: P06TABLEREPORTOVERDUEVAR
                                              .isHoveredClear
                                          ? Colors.redAccent.shade700
                                          : Colors.yellowAccent.shade700,
                                      end: P06TABLEREPORTOVERDUEVAR
                                              .isHoveredClear
                                          ? Colors.yellowAccent.shade700
                                          : Colors.redAccent.shade700,
                                    ),
                                    duration: Duration(milliseconds: 200),
                                    builder: (context, color, child) {
                                      return Text(
                                        'CLEAR',
                                        style: TextStyle(
                                          fontSize: size,
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<P06TABLEREPORTOVERDUEGETDATA_Bloc>()
                          .add(P06TABLEREPORTOVERDUEGETDATA_GET());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                  Column(
                    children: [
                      if (P06TABLEREPORTOVERDUEVAR.DropDownGroup.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownYear.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownMonth.isNotEmpty)
                        SizedBox(
                          width: 100,
                          child: Text(
                            'GROUP',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      AdvanceDropDown(
                        hint: "GROUP",
                        listdropdown: const [
                          MapEntry("GROUP", ""),
                          MapEntry("1", "1"),
                          MapEntry("2", "2"),
                          MapEntry("5", "5"),
                          MapEntry("6", "6"),
                        ],
                        onChangeinside: (d, k) {
                          setState(() {
                            P06TABLEREPORTOVERDUEVAR.DropDownGroup = d;
                          });
                        },
                        value: P06TABLEREPORTOVERDUEVAR.DropDownGroup,
                        height: 30,
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      if (P06TABLEREPORTOVERDUEVAR.DropDownGroup.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownYear.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownMonth.isNotEmpty)
                        SizedBox(
                          width: 100,
                          child: Text(
                            'YEAR',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      AdvanceDropDown(
                        hint: "YEAR",
                        listdropdown: const [
                          MapEntry("YEAR", ""),
                          MapEntry("2024", "2024"),
                          MapEntry("2025", "2025"),
                          MapEntry("2026", "2026"),
                          MapEntry("2027", "2027"),
                          MapEntry("2028", "2028"),
                          MapEntry("2029", "2029"),
                          MapEntry("2030", "2030"),
                          MapEntry("2031", "2031"),
                          MapEntry("2032", "2032"),
                          MapEntry("2033", "2033"),
                          MapEntry("2034", "2034"),
                          MapEntry("2035", "2035"),
                          MapEntry("2036", "2036"),
                          MapEntry("2037", "2037"),
                          MapEntry("2038", "2038"),
                          MapEntry("2039", "2039"),
                          MapEntry("2040", "2040"),
                        ],
                        onChangeinside: (d, k) {
                          setState(() {
                            P06TABLEREPORTOVERDUEVAR.DropDownYear = d;
                          });
                        },
                        value: P06TABLEREPORTOVERDUEVAR.DropDownYear,
                        height: 30,
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      if (P06TABLEREPORTOVERDUEVAR.DropDownGroup.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownYear.isNotEmpty ||
                          P06TABLEREPORTOVERDUEVAR.DropDownMonth.isNotEmpty)
                        SizedBox(
                          width: 100,
                          child: Text(
                            'MONTH',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      AdvanceDropDown(
                        hint: "MONTH",
                        listdropdown: const [
                          MapEntry("MONTH", ""),
                          MapEntry("Jan", "Jan"),
                          MapEntry("Feb", "Feb"),
                          MapEntry("Mar", "Mar"),
                          MapEntry("Apr", "Apr"),
                          MapEntry("May", "May"),
                          MapEntry("Jun", "Jun"),
                          MapEntry("Jul", "Jul"),
                          MapEntry("Aug", "Aug"),
                          MapEntry("Sep", "Sep"),
                          MapEntry("Oct", "Oct"),
                          MapEntry("Nov", "Nov"),
                          MapEntry("Dec", "Dec"),
                        ],
                        onChangeinside: (d, k) {
                          setState(() {
                            P06TABLEREPORTOVERDUEVAR.DropDownMonth = d;
                          });
                        },
                        value: P06TABLEREPORTOVERDUEVAR.DropDownMonth,
                        height: 30,
                        width: 100,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(25),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'NO.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...newData.map((item) {
                        int dataCount = newData.indexOf(item) + 1;
                        return TableRow(
                          children: [
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Center(
                                  child: Text(
                                    dataCount.toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      Table(
                        border: TableBorder(
                          top: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        columnWidths: const {
                          0: FixedColumnWidth(100),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 80,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'Type',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (groupADataCount > 0)
                        Container(
                          height: max(groupADataCount * 20, 0.5) - 0.5,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Group A: Long\nsample preparation\ntime',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      if (groupBDataCount > 0)
                        Container(
                          height: groupBDataCount * 20 + 0.5,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Group B: Other\n(Not long sample\npreparation time)',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(50),
                      1: FixedColumnWidth(100),
                      2: FixedColumnWidth(50),
                      3: FixedColumnWidth(70),
                      4: FixedColumnWidth(70),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Group',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Customer and line',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...newData.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Center(
                                    child: Text(
                                  item['group'] ?? '',
                                  style: TextStyle(fontSize: 10),
                                )),
                              ),
                            ),
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ' ${item['customer'] ?? ''}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      Table(
                        border: TableBorder(
                          top: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        columnWidths: const {
                          0: FixedColumnWidth(60),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 80,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'KPI\nreport\nperiod\n(Days)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (groupADataCount > 0)
                        Container(
                          height: max(groupADataCount * 20, 0.5) - 0.5,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Within 12 WD\n100%',
                              style: TextStyle(fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      if (groupBDataCount > 0)
                        Container(
                          height: groupBDataCount * 20 + 0.5,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Within 10 WD\n100%',
                              style: TextStyle(fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(70),
                      1: FixedColumnWidth(70),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Frequency\n(Time/Month)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Incharge',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...newData.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item['frequency'] ?? '',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item['incharge'] ?? '',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 1250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Operation (Date-Month-Year)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            columnWidths: const {
                              0: FixedColumnWidth(50),
                              1: FixedColumnWidth(50),
                              2: FixedColumnWidth(50),
                              3: FixedColumnWidth(50),
                              4: FixedColumnWidth(50),
                              5: FixedColumnWidth(50),
                              6: FixedColumnWidth(50),
                              7: FixedColumnWidth(50),
                              8: FixedColumnWidth(50),
                              9: FixedColumnWidth(50),
                              10: FixedColumnWidth(50),
                              11: FixedColumnWidth(50),
                              12: FixedColumnWidth(50),
                              13: FixedColumnWidth(50),
                              14: FixedColumnWidth(50),
                              15: FixedColumnWidth(50),
                              16: FixedColumnWidth(50),
                              17: FixedColumnWidth(50),
                              18: FixedColumnWidth(50),
                              19: FixedColumnWidth(50),
                              20: FixedColumnWidth(50),
                              21: FixedColumnWidth(50),
                              22: FixedColumnWidth(50),
                              23: FixedColumnWidth(50),
                              24: FixedColumnWidth(50),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sampling',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Request\nsample',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'TTC\nresult',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Due\ndate',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Issue\ndate',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'MGR\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'MGR\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'MGR\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'MGR\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Send to\ncustomer',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...newData.map((item) {
                                return TableRow(
                                  children: [
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['act sam'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['request'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['ttcresult'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['rep due'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['issuedate'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['sublead'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['gl'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['mgr'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['jp'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['revise1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['sublead1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['gl1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['mgr1'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['jp1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['revise2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['sublead2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['gl2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['mgr2'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['jp2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['revise3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['sublead3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['gl3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['mgr3'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['jp3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['sent rep'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 1250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Break down working Day (Day)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              top: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            columnWidths: const {
                              0: FixedColumnWidth(50),
                              1: FixedColumnWidth(50),
                              2: FixedColumnWidth(50),
                              3: FixedColumnWidth(50),
                              4: FixedColumnWidth(50),
                              5: FixedColumnWidth(50),
                              6: FixedColumnWidth(50),
                              7: FixedColumnWidth(50),
                              8: FixedColumnWidth(50),
                              9: FixedColumnWidth(50),
                              10: FixedColumnWidth(50),
                              11: FixedColumnWidth(50),
                              12: FixedColumnWidth(50),
                              13: FixedColumnWidth(50),
                              14: FixedColumnWidth(50),
                              15: FixedColumnWidth(50),
                              16: FixedColumnWidth(50),
                              17: FixedColumnWidth(50),
                              18: FixedColumnWidth(50),
                              19: FixedColumnWidth(50),
                              20: FixedColumnWidth(50),
                              21: FixedColumnWidth(50),
                              22: FixedColumnWidth(50),
                              23: FixedColumnWidth(50),
                              24: FixedColumnWidth(50),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Prepare\n+Request\nsample',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'TTC\nanalysis',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Issue\nreport\nafter\nTTC\nanalysis',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Mgr\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Mgr\nsign1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Mgr\nsign2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Revise\nreport 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sub lead\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'GL\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Mgr\nsign3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'JP\nsign 3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Sent to\ncustomer',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Total Day\n(amount)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'Over due\n(Days)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...newData.map((item) {
                                final int bdprepare = int.tryParse(
                                        item['bdprepare']?.toString() ?? '0') ??
                                    0;
                                final int bdttc = int.tryParse(
                                        item['bdttc']?.toString() ?? '0') ??
                                    0;
                                final int bdissue = int.tryParse(
                                        item['bdissue']?.toString() ?? '0') ??
                                    0;
                                final double bdsublead = double.tryParse(
                                        item['bdsublead']?.toString() ?? '0') ??
                                    0.0;
                                final double bdgl = double.tryParse(
                                        item['bdgl']?.toString() ?? '0') ??
                                    0.0;
                                final double bdmgr = double.tryParse(
                                        item['bdmgr']?.toString() ?? '0') ??
                                    0.0;
                                final double bdjp = double.tryParse(
                                        item['bdjp']?.toString() ?? '0') ??
                                    0.0;
                                final double bdrevise1 = double.tryParse(
                                        item['bdrevise1']?.toString() ?? '0') ??
                                    0.0;
                                final double bdsublead1 = double.tryParse(
                                        item['bdsublead1']?.toString() ??
                                            '0') ??
                                    0.0;
                                final double bdgl1 = double.tryParse(
                                        item['bdgl1']?.toString() ?? '0') ??
                                    0.0;
                                final double bdmgr1 = double.tryParse(
                                        item['bdmgr1']?.toString() ?? '0') ??
                                    0.0;
                                final double bdjp1 = double.tryParse(
                                        item['bdjp1']?.toString() ?? '0') ??
                                    0.0;
                                final double bdrevise2 = double.tryParse(
                                        item['bdrevise2']?.toString() ?? '0') ??
                                    0.0;
                                final double bdsublead2 = double.tryParse(
                                        item['bdsublead2']?.toString() ??
                                            '0') ??
                                    0.0;
                                final double bdgl2 = double.tryParse(
                                        item['bdgl2']?.toString() ?? '0') ??
                                    0.0;
                                final double bdmgr2 = double.tryParse(
                                        item['bdmgr2']?.toString() ?? '0') ??
                                    0.0;
                                final double bdjp2 = double.tryParse(
                                        item['bdjp2']?.toString() ?? '0') ??
                                    0.0;
                                final double bdrevise3 = double.tryParse(
                                        item['bdrevise3']?.toString() ?? '0') ??
                                    0.0;
                                final double bdsublead3 = double.tryParse(
                                        item['bdsublead3']?.toString() ??
                                            '0') ??
                                    0.0;
                                final double bdgl3 = double.tryParse(
                                        item['bdgl3']?.toString() ?? '0') ??
                                    0.0;
                                final double bdmgr3 = double.tryParse(
                                        item['bdmgr3']?.toString() ?? '0') ??
                                    0.0;
                                final double bdjp3 = double.tryParse(
                                        item['bdjp3']?.toString() ?? '0') ??
                                    0.0;
                                final int bdsent = int.tryParse(
                                        item['bdsent']?.toString() ?? '0') ??
                                    0;
                                final int kpiperiod = int.tryParse(
                                        item['kpi period']?.toString() ??
                                            '0') ??
                                    0;
                                final double avgSumbdrevise = calculateAverage(
                                    bdrevise1, bdrevise2, bdrevise3, '');
                                final double avgSumbdsublead = calculateAverage(
                                    bdsublead,
                                    bdsublead1,
                                    bdsublead2,
                                    bdsublead3);
                                final double avgSumbdgl =
                                    calculateAverage(bdgl, bdgl1, bdgl2, bdgl3);
                                final double avgSumbdmgr = calculateAverage(
                                    bdmgr, bdmgr1, bdmgr2, bdmgr3);
                                final double avgSumbdjp =
                                    calculateAverage(bdjp, bdjp1, bdjp2, bdjp3);
                                final double SumTotalDay = bdprepare +
                                    bdttc +
                                    bdissue +
                                    avgSumbdrevise +
                                    avgSumbdsublead +
                                    avgSumbdgl +
                                    avgSumbdmgr +
                                    avgSumbdjp +
                                    bdsent;
                                final double OverDueDay =
                                    SumTotalDay - kpiperiod;
                                return TableRow(
                                  children: [
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdprepare'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdttc'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdissue'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdsublead'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdgl'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdmgr'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdjp'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdrevise1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdsublead1'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdgl1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdmgr1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdjp1'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdrevise2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdsublead2'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdgl2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdmgr2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdjp2'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdrevise3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdsublead3'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdgl3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdmgr3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            item['bdjp3'] ?? '',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                          item['bdsent'] ?? '',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            SumTotalDay.toStringAsFixed(2),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            OverDueDay.toStringAsFixed(2),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      verticalInside: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      top: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(250),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Reason',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...newData.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: SizedBox(
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item['reason'] ?? '',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double calculateAverage(
    dynamic val1, dynamic val2, dynamic val3, dynamic val4) {
  int count = 0;
  double sum = 0.0;

  if (val1 != 0 && val1 != '') {
    sum += double.tryParse(val1.toString()) ?? 0;
    count++;
  }
  if (val2 != 0 && val2 != '') {
    sum += double.tryParse(val2.toString()) ?? 0;
    count++;
  }
  if (val3 != 0 && val3 != '') {
    sum += double.tryParse(val3.toString()) ?? 0;
    count++;
  }
  if (val4 != 0 && val4 != '') {
    sum += double.tryParse(val4.toString()) ?? 0;
    count++;
  }

  // หากจำนวน count เป็น 0 ให้ return ค่า 0 เพื่อป้องกันการหารด้วย 0
  return count > 0 ? sum / count : 0;
}
