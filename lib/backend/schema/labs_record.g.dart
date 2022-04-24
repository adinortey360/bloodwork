// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LabsRecord> _$labsRecordSerializer = new _$LabsRecordSerializer();

class _$LabsRecordSerializer implements StructuredSerializer<LabsRecord> {
  @override
  final Iterable<Type> types = const [LabsRecord, _$LabsRecord];
  @override
  final String wireName = 'LabsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LabsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.doctor;
    if (value != null) {
      result
        ..add('doctor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorNumber;
    if (value != null) {
      result
        ..add('doctor_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  LabsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LabsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'doctor':
          result.doctor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'doctor_number':
          result.doctorNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$LabsRecord extends LabsRecord {
  @override
  final String doctor;
  @override
  final String doctorNumber;
  @override
  final DocumentReference<Object> reference;

  factory _$LabsRecord([void Function(LabsRecordBuilder) updates]) =>
      (new LabsRecordBuilder()..update(updates)).build();

  _$LabsRecord._({this.doctor, this.doctorNumber, this.reference}) : super._();

  @override
  LabsRecord rebuild(void Function(LabsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LabsRecordBuilder toBuilder() => new LabsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LabsRecord &&
        doctor == other.doctor &&
        doctorNumber == other.doctorNumber &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, doctor.hashCode), doctorNumber.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LabsRecord')
          ..add('doctor', doctor)
          ..add('doctorNumber', doctorNumber)
          ..add('reference', reference))
        .toString();
  }
}

class LabsRecordBuilder implements Builder<LabsRecord, LabsRecordBuilder> {
  _$LabsRecord _$v;

  String _doctor;
  String get doctor => _$this._doctor;
  set doctor(String doctor) => _$this._doctor = doctor;

  String _doctorNumber;
  String get doctorNumber => _$this._doctorNumber;
  set doctorNumber(String doctorNumber) => _$this._doctorNumber = doctorNumber;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LabsRecordBuilder() {
    LabsRecord._initializeBuilder(this);
  }

  LabsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctor = $v.doctor;
      _doctorNumber = $v.doctorNumber;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LabsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LabsRecord;
  }

  @override
  void update(void Function(LabsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LabsRecord build() {
    final _$result = _$v ??
        new _$LabsRecord._(
            doctor: doctor, doctorNumber: doctorNumber, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
