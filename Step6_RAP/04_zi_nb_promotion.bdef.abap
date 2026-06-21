managed implementation in class zbp_i_nb_promotion unique;
strict ( 2 );
with draft;

define behavior for ZI_NB_Promotion alias Promotion
persistent table znb_promo
draft table znb_promo_d
lock master total etag LastChangedAt
authorization master ( instance )
etag master LocalLastChangedAt
{
  field ( numbering : managed, readonly ) PromoId;
  field ( readonly ) CreatedBy, CreatedAt, LastChangedBy, LastChangedAt, LocalLastChangedAt;
  field ( mandatory ) Name, DiscountPct, CompanyCode, ValidFrom, ValidTo;

  create;
  update;
  delete;
  draft action Edit;
  draft action Activate optimized;
  draft action Discard;
  draft action Resume;
  draft determine action Prepare;

  validation validateDiscount on save { create; update; field DiscountPct; }
  validation validateDateRange on save { create; update; field ValidFrom, ValidTo; }
  validation validateCompanyCode on save { create; update; field CompanyCode; }

  determination defaultIsActive on modify { create; }

  mapping for znb_promo
  {
    PromoId            = promo_id;
    Name               = name;
    DiscountPct        = discount_pct;
    CompanyCode        = company_code;
    ValidFrom          = valid_from;
    ValidTo            = valid_to;
    IsActive           = is_active;
    CreatedBy          = created_by;
    CreatedAt          = created_at;
    LastChangedBy      = last_changed_by;
    LastChangedAt      = last_changed_at;
    LocalLastChangedAt = local_last_changed_at;
  }
}
