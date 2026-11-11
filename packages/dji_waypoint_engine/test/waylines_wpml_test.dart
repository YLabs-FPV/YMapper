import 'package:dji_waypoint_engine/engine.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('HeadingParam', () {
    test('followWayline mode emits "0" for waypointHeadingAngle', () {
      final param = HeadingParam(
          headingMode: HeadingMode.followWayline,
          headingPathMode: HeadingPathMode.followBadArc);

      expect(param.getElement('wpml:waypointHeadingAngle')?.innerText, '0');
      expect(param.getElement('wpml:waypointHeadingMode')?.innerText,
          'followWayline');
    });

    test(
        'smoothTransition mode emits the numeric headingAngle, not the enum name',
        () {
      final param = HeadingParam(
          headingMode: HeadingMode.smoothTransition,
          headingAngle: 275,
          headingAngleEnable: true,
          headingPathMode: HeadingPathMode.followBadArc);

      // Regression check for a bug where the enum's toString() was written
      // instead of the numeric angle (e.g. "HeadingMode.smoothTransition").
      expect(param.getElement('wpml:waypointHeadingAngle')?.innerText, '275');
      expect(
          param.getElement('wpml:waypointHeadingAngleEnable')?.innerText,
          '1');
    });
  });
}
