// SPDX-License-Identifier: BSD-3-Clause
//
// linear_feedback_shift_register_test.dart
// Tests for linear feedback shift register
//
// 2024 September 1
// Author: Omonefe Itietie <omonefe.itietie@intel.com>

import 'dart:async';

import 'package:rohd/rohd.dart';
import 'package:rohd_hcl/rohd_hcl.dart';
import 'package:rohd_hcl/src/linear_feedback_shift_register.dart';
import 'package:rohd_vf/rohd_vf.dart';
import 'package:test/test.dart';

void main() {
      test('Test LFSR creation', () async {
    final dataIn = Logic(width: 4)..put(bin('1000')); // initial state
    final clk = SimpleClockGenerator(6).clk;
    final state = Logic(width: 4)..put(bin('1000')); // explicitly setting initial state
    const shifts = 6;
    final taps = Logic(width: 4)..put(bin('1010')); // tap positions
    final lfsr = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state, shifts: shifts, taps: taps);

    final dataOut = lfsr.dataOut;

    await lfsr.build();

    // Expected LFSR outputs
    final expectedData = [8, 12, 6, 3, 9, 4, 2, 1]; // Adjusted sequence based on LFSR logic

    unawaited(Simulator.run());
    await clk.waitCycles(5);

    for (var i = 0; i < expectedData.length; i++) {
      await clk.nextPosedge;
      expect(dataOut.value.toInt(), expectedData[i]); // Checking dataOut
    }

    await Simulator.endSimulation();
  });

  //   test('Test LFSR naming', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Test LFSR with width 0', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Test LFSR with width 0', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Test Enabled LFSR', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Test LFSR with width 0', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Test LFSR with reset value', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });


  // test('Test LFSR with null reset value', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final mod = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await mod.build();
  //   final sv = mod.generateSynth();
  //   print(sv);
  // });

  // test('Print LFSR SV Code', () async {
  //   final dataIn = Logic(width: 5);
  //   final clk = SimpleClockGenerator(10).clk;
  //   final state = Logic(width: 5);
  //   const shifts = 5;
  //   final taps = Logic(width: 2);
  //   final enable = Logic();
  //   final reset = Logic();
  //   final lfsr = LinearFeedbackShiftRegister(dataIn, clk: clk, state: state,
  //                 shifts: shifts, taps: taps, enable: enable, reset: reset);
  //   await lfsr.build();
  //   final sv = lfsr.generateSynth();
  //   print(sv);
  // });
}
