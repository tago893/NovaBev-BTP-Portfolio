@EndUserText.label : 'NovaBev Promotion'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #LIMITED
define table znb_promo {
  key client     : abap.clnt not null;
  key promo_id   : sysuuid_x16 not null;
  name           : abap.char(60);
  discount_pct   : abap.dec(5,2);
  company_code   : abap.char(4);
  valid_from     : abap.dats;
  valid_to       : abap.dats;
  is_active      : abap_boolean;
  created_by     : abp_creation_user;
  created_at     : abp_creation_tstmpl;
  last_changed_by   : abp_lastchange_user;
  last_changed_at   : abp_lastchange_tstmpl;
  local_last_changed_at : abp_locinst_lastchange_tstmpl;
}
