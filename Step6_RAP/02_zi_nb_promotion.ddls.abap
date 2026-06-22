@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ' Interface view for promotion'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_NB_Promotion 
as select from znb_promo as p
{
     key p.promo_id           as PromoId,
      p.name                  as Name,
      p.discount_pct          as DiscountPct,
      p.company_code          as CompanyCode,
      p.valid_from            as ValidFrom,
      p.valid_to              as ValidTo,
      p.is_active             as IsActive,

      // ---- administrative ----
      @Semantics.user.createdBy: true
      p.created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      p.created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      p.last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      p.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      p.local_last_changed_at as LocalLastChangedAt
}
