@EndUserText.label : 'Draft table for znb_promo'
@AbapCatalog.enhancement.category : #EXTENSIBLE_ANY
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table znb_promo_d {

  key mandt          : mandt not null;
  key promoid        : sysuuid_x16 not null;
  name               : abap.char(60);
  discountpct        : abap.dec(5,2);
  companycode        : abap.char(4);
  validfrom          : abap.dats;
  validto            : abap.dats;
  isactive           : abap_boolean;
  createdby          : abp_creation_user;
  createdat          : abp_creation_tstmpl;
  lastchangedby      : abp_lastchange_user;
  lastchangedat      : abp_lastchange_tstmpl;
  locallastchangedat : abp_locinst_lastchange_tstmpl;
  "%admin"           : include sych_bdl_draft_admin_inc;

}