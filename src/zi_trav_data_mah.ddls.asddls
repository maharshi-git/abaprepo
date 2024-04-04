@EndUserText.label: 'Travel data XXX'

@AccessControl.authorizationCheck: #NOT_REQUIRED

define root view entity ZI_TRAV_DATA_MAH

as select from ztrav_data_mah as Travel

/* Associations */

association [0..1] to /DMO/I_Agency as _Agency on $projection.agency_id = _Agency.AgencyID

association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID

association [0..1] to I_Currency as _Currency on $projection.currency_code = _Currency.Currency

association [0..*] to zuser_data_mah as _User on $projection.customer_id = _User.customer_id

{

key mykey,

travel_id,

agency_id,

customer_id,

begin_date,

end_date,

@Semantics.amount.currencyCode: 'currency_code'

booking_fee,

@Semantics.amount.currencyCode: 'currency_code'

total_price,

currency_code,

overall_status,

description,

/*-- Admin data --*/

@Semantics.user.createdBy: true

created_by,

@Semantics.systemDateTime.createdAt: true

created_at,

@Semantics.user.lastChangedBy: true

last_changed_by,

@Semantics.systemDateTime.lastChangedAt: true

last_changed_at,

/* Public associations */

_Agency,

_Customer,

_Currency,

_User

}
