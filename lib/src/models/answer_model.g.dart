// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnswerCollection on Isar {
  IsarCollection<Answer> get answers => this.collection();
}

const AnswerSchema = CollectionSchema(
  name: r'Answer',
  id: -5347394118497230781,
  properties: {
    r'other': PropertySchema(
      id: 0,
      name: r'other',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 1,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'responseId': PropertySchema(
      id: 2,
      name: r'responseId',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 3,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _answerEstimateSize,
  serialize: _answerSerialize,
  deserialize: _answerDeserialize,
  deserializeProp: _answerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _answerGetId,
  getLinks: _answerGetLinks,
  attach: _answerAttach,
  version: '3.1.0+1',
);

int _answerEstimateSize(
  Answer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.other;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.value.length * 3;
  return bytesCount;
}

void _answerSerialize(
  Answer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.other);
  writer.writeLong(offsets[1], object.questionId);
  writer.writeLong(offsets[2], object.responseId);
  writer.writeString(offsets[3], object.value);
}

Answer _answerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Answer(
    id: id,
    other: reader.readStringOrNull(offsets[0]),
    questionId: reader.readLong(offsets[1]),
    responseId: reader.readLong(offsets[2]),
    value: reader.readString(offsets[3]),
  );
  return object;
}

P _answerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _answerGetId(Answer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _answerGetLinks(Answer object) {
  return [];
}

void _answerAttach(IsarCollection<dynamic> col, Id id, Answer object) {
  object.id = id;
}

extension AnswerQueryWhereSort on QueryBuilder<Answer, Answer, QWhere> {
  QueryBuilder<Answer, Answer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnswerQueryWhere on QueryBuilder<Answer, Answer, QWhereClause> {
  QueryBuilder<Answer, Answer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Answer, Answer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Answer, Answer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Answer, Answer, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnswerQueryFilter on QueryBuilder<Answer, Answer, QFilterCondition> {
  QueryBuilder<Answer, Answer, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'other',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'other',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'other',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'other',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'other',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> otherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'other',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> questionIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> questionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> questionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> questionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> responseIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> responseIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'responseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> responseIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'responseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> responseIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'responseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension AnswerQueryObject on QueryBuilder<Answer, Answer, QFilterCondition> {}

extension AnswerQueryLinks on QueryBuilder<Answer, Answer, QFilterCondition> {}

extension AnswerQuerySortBy on QueryBuilder<Answer, Answer, QSortBy> {
  QueryBuilder<Answer, Answer, QAfterSortBy> sortByOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByResponseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseId', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByResponseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseId', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension AnswerQuerySortThenBy on QueryBuilder<Answer, Answer, QSortThenBy> {
  QueryBuilder<Answer, Answer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByResponseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseId', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByResponseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseId', Sort.desc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<Answer, Answer, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension AnswerQueryWhereDistinct on QueryBuilder<Answer, Answer, QDistinct> {
  QueryBuilder<Answer, Answer, QDistinct> distinctByOther(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'other', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Answer, Answer, QDistinct> distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<Answer, Answer, QDistinct> distinctByResponseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseId');
    });
  }

  QueryBuilder<Answer, Answer, QDistinct> distinctByValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value', caseSensitive: caseSensitive);
    });
  }
}

extension AnswerQueryProperty on QueryBuilder<Answer, Answer, QQueryProperty> {
  QueryBuilder<Answer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Answer, String?, QQueryOperations> otherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'other');
    });
  }

  QueryBuilder<Answer, int, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<Answer, int, QQueryOperations> responseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseId');
    });
  }

  QueryBuilder<Answer, String, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
