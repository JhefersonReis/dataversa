// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSurveyCollection on Isar {
  IsarCollection<Survey> get surveys => this.collection();
}

const SurveySchema = CollectionSchema(
  name: r'Survey',
  id: 4895026889124710243,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.string,
    ),
    r'expires': PropertySchema(
      id: 1,
      name: r'expires',
      type: IsarType.string,
    ),
    r'startdate': PropertySchema(
      id: 2,
      name: r'startdate',
      type: IsarType.string,
    ),
    r'surveylsTitle': PropertySchema(
      id: 3,
      name: r'surveylsTitle',
      type: IsarType.string,
    )
  },
  estimateSize: _surveyEstimateSize,
  serialize: _surveySerialize,
  deserialize: _surveyDeserialize,
  deserializeProp: _surveyDeserializeProp,
  idName: r'sid',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _surveyGetId,
  getLinks: _surveyGetLinks,
  attach: _surveyAttach,
  version: '3.1.0+1',
);

int _surveyEstimateSize(
  Survey object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.active.length * 3;
  {
    final value = object.expires;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.startdate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.surveylsTitle.length * 3;
  return bytesCount;
}

void _surveySerialize(
  Survey object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.active);
  writer.writeString(offsets[1], object.expires);
  writer.writeString(offsets[2], object.startdate);
  writer.writeString(offsets[3], object.surveylsTitle);
}

Survey _surveyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Survey(
    active: reader.readString(offsets[0]),
    expires: reader.readStringOrNull(offsets[1]),
    sid: id,
    startdate: reader.readStringOrNull(offsets[2]),
    surveylsTitle: reader.readString(offsets[3]),
  );
  return object;
}

P _surveyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _surveyGetId(Survey object) {
  return object.sid;
}

List<IsarLinkBase<dynamic>> _surveyGetLinks(Survey object) {
  return [];
}

void _surveyAttach(IsarCollection<dynamic> col, Id id, Survey object) {
  object.sid = id;
}

extension SurveyQueryWhereSort on QueryBuilder<Survey, Survey, QWhere> {
  QueryBuilder<Survey, Survey, QAfterWhere> anySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SurveyQueryWhere on QueryBuilder<Survey, Survey, QWhereClause> {
  QueryBuilder<Survey, Survey, QAfterWhereClause> sidEqualTo(Id sid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: sid,
        upper: sid,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterWhereClause> sidNotEqualTo(Id sid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: sid, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: sid, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: sid, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: sid, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Survey, Survey, QAfterWhereClause> sidGreaterThan(Id sid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: sid, includeLower: include),
      );
    });
  }

  QueryBuilder<Survey, Survey, QAfterWhereClause> sidLessThan(Id sid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: sid, includeUpper: include),
      );
    });
  }

  QueryBuilder<Survey, Survey, QAfterWhereClause> sidBetween(
    Id lowerSid,
    Id upperSid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerSid,
        includeLower: includeLower,
        upper: upperSid,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SurveyQueryFilter on QueryBuilder<Survey, Survey, QFilterCondition> {
  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'active',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'active',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'active',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> activeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'active',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expires',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expires',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expires',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expires',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expires',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expires',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> expiresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expires',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> sidEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> sidGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> sidLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> sidBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startdate',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startdate',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startdate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startdate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> startdateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startdate',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveylsTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveylsTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveylsTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition> surveylsTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveylsTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Survey, Survey, QAfterFilterCondition>
      surveylsTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveylsTitle',
        value: '',
      ));
    });
  }
}

extension SurveyQueryObject on QueryBuilder<Survey, Survey, QFilterCondition> {}

extension SurveyQueryLinks on QueryBuilder<Survey, Survey, QFilterCondition> {}

extension SurveyQuerySortBy on QueryBuilder<Survey, Survey, QSortBy> {
  QueryBuilder<Survey, Survey, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortByExpires() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expires', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortByExpiresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expires', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortByStartdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startdate', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortByStartdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startdate', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortBySurveylsTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveylsTitle', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> sortBySurveylsTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveylsTitle', Sort.desc);
    });
  }
}

extension SurveyQuerySortThenBy on QueryBuilder<Survey, Survey, QSortThenBy> {
  QueryBuilder<Survey, Survey, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenByExpires() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expires', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenByExpiresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expires', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenBySidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenByStartdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startdate', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenByStartdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startdate', Sort.desc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenBySurveylsTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveylsTitle', Sort.asc);
    });
  }

  QueryBuilder<Survey, Survey, QAfterSortBy> thenBySurveylsTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveylsTitle', Sort.desc);
    });
  }
}

extension SurveyQueryWhereDistinct on QueryBuilder<Survey, Survey, QDistinct> {
  QueryBuilder<Survey, Survey, QDistinct> distinctByActive(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Survey, Survey, QDistinct> distinctByExpires(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expires', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Survey, Survey, QDistinct> distinctByStartdate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startdate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Survey, Survey, QDistinct> distinctBySurveylsTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveylsTitle',
          caseSensitive: caseSensitive);
    });
  }
}

extension SurveyQueryProperty on QueryBuilder<Survey, Survey, QQueryProperty> {
  QueryBuilder<Survey, int, QQueryOperations> sidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sid');
    });
  }

  QueryBuilder<Survey, String, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<Survey, String?, QQueryOperations> expiresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expires');
    });
  }

  QueryBuilder<Survey, String?, QQueryOperations> startdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startdate');
    });
  }

  QueryBuilder<Survey, String, QQueryOperations> surveylsTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveylsTitle');
    });
  }
}
