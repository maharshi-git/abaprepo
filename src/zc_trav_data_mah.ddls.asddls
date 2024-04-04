@EndUserText.label: 'Travel projection view - Processor'

@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {

headerInfo: { typeName: 'Travel', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'TravelID' } } }

@Search.searchable: true

@Metadata.allowExtensions:true

@ObjectModel.semanticKey: ['TravelID']
@ObjectModel.resultSet.sizeCategory: #XS -- drop down menu for value help

define root view entity ZC_TRAV_DATA_MAH

provider contract transactional_query

as projection on ZI_TRAV_DATA_MAH

{


@UI.hidden: true

key mykey as TravelUUID,

@EndUserText.label: 'Travel'
@ObjectModel.text.element:  [ 'Description' ]
travel_id as TravelID,


@EndUserText.label: 'Agency'
@ObjectModel.text.element: ['AgencyName']
agency_id as AgencyID,
_Agency.Name as AgencyName,



customer_id as CustomerID,



_Customer.LastName as CustomerName,



begin_date as BeginDate,



end_date as EndDate,

@UI: {

lineItem: [ { position: 50, importance: #MEDIUM } ],

identification: [ { position: 50, label: 'Total Price' } ] }

@Semantics.amount.currencyCode: 'CurrencyCode'

total_price as TotalPrice,

@Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]

currency_code as CurrencyCode,

@UI: {

lineItem: [ { position: 60, importance: #HIGH },

{ type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept Travel' } ],

identification: [ { position: 60, label: 'Status [O(Open)|A(Accepted)|X(Canceled)]' } ] }

overall_status as TravelStatus,

@UI.identification: [ { position: 70, label: 'Remarks' } ]

description as Description,

@UI.hidden: true

last_changed_at as LastChangedAt

}
