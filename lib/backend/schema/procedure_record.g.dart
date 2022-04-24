// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProcedureRecord> _$procedureRecordSerializer =
    new _$ProcedureRecordSerializer();

class _$ProcedureRecordSerializer
    implements StructuredSerializer<ProcedureRecord> {
  @override
  final Iterable<Type> types = const [ProcedureRecord, _$ProcedureRecord];
  @override
  final String wireName = 'ProcedureRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProcedureRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.parent;
    if (value != null) {
      result
        ..add('parent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
  ProcedureRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProcedureRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$ProcedureRecord extends ProcedureRecord {
  @override
  final String parent;
  @override
  final String name;
  @override
  final DocumentReference<Object> reference;

  factory _$ProcedureRecord([void Function(ProcedureRecordBuilder) updates]) =>
      (new ProcedureRecordBuilder()..update(updates)).build();

  _$ProcedureRecord._({this.parent, this.name, this.reference}) : super._();

  @override
  ProcedureRecord rebuild(void Function(ProcedureRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcedureRecordBuilder toBuilder() =>
      new ProcedureRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcedureRecord &&
        parent == other.parent &&
        name == other.name &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, parent.hashCode), name.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProcedureRecord')
          ..add('parent', parent)
          ..add('name', name)
          ..add('reference', reference))
        .toString();
  }
}

class ProcedureRecordBuilder
    implements Builder<ProcedureRecord, ProcedureRecordBuilder> {
  _$ProcedureRecord _$v;

  String _parent;
  String get parent => _$this._parent;
  set parent(String parent) => _$this._parent = parent;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProcedureRecordBuilder() {
    ProcedureRecord._initializeBuilder(this);
  }

  ProcedureRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parent = $v.parent;
      _name = $v.name;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcedureRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcedureRecord;
  }

  @override
  void update(void Function(ProcedureRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProcedureRecord build() {
    final _$result = _$v ??
        new _$ProcedureRecord._(
            parent: parent, name: name, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
