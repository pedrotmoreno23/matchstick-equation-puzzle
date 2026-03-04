import '../../core/constants/segment_id.dart';

class DigitSegments {
  // Canonical 7-segment digit definitions (V1: single variant per digit)
  static final Map<int, Set<SegmentId>> digitMap = {
    0: {SegmentId.a, SegmentId.b, SegmentId.c, SegmentId.d, SegmentId.e, SegmentId.f},
    1: {SegmentId.b, SegmentId.c},
    2: {SegmentId.a, SegmentId.b, SegmentId.g, SegmentId.e, SegmentId.d},
    3: {SegmentId.a, SegmentId.b, SegmentId.c, SegmentId.d, SegmentId.g},
    4: {SegmentId.f, SegmentId.g, SegmentId.b, SegmentId.c},
    5: {SegmentId.a, SegmentId.f, SegmentId.g, SegmentId.c, SegmentId.d},
    6: {SegmentId.a, SegmentId.f, SegmentId.g, SegmentId.e, SegmentId.c, SegmentId.d},
    7: {SegmentId.a, SegmentId.b, SegmentId.c},
    8: {SegmentId.a, SegmentId.b, SegmentId.c, SegmentId.d, SegmentId.e, SegmentId.f, SegmentId.g},
    9: {SegmentId.a, SegmentId.b, SegmentId.c, SegmentId.d, SegmentId.f, SegmentId.g},
  };

  /// Returns the segments for a digit (0-9). Returns null if out of range.
  static Set<SegmentId>? segmentsForDigit(int digit) => digitMap[digit];

  /// Reverse lookup: returns the digit if the given set matches exactly.
  /// Returns null if it matches no digit.
  static int? digitFromSegments(Set<SegmentId> segments) {
    for (final entry in digitMap.entries) {
      final value = entry.value;
      if (value.length == segments.length && value.containsAll(segments)) {
        return entry.key;
      }
    }
    return null;
  }
}