@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'NovaBev Promotion - Consumption / UI'
@Metadata.allowExtensions: true
@Search.searchable: true

@UI.headerInfo: {
  typeName: 'Promotion',
  typeNamePlural: 'Promotions',
  title: { type: #STANDARD, value: 'Name' }
}

define root view entity ZC_NB_Promotion
  provider contract transactional_query
  as projection on ZI_NB_Promotion
{
      @UI.facet: [
        { id: 'idGeneral', type: #IDENTIFICATION_REFERENCE, label: 'General', position: 10 }
      ]
      @UI.lineItem: [{ position: 10, importance: #HIGH, label: 'Promo ID' }]
      @UI.identification: [{ position: 10 }]
  key PromoId,

      @UI.lineItem: [{ position: 20, importance: #HIGH, label: 'Name' }]
      @UI.identification: [{ position: 20 }]
      @UI.selectionField: [{ position: 10 }]
      @Search.defaultSearchElement: true
      Name,

      @UI.lineItem: [{ position: 30, importance: #HIGH, label: 'Discount %' }]
      @UI.identification: [{ position: 30 }]
      DiscountPct,

      @UI.lineItem: [{ position: 40, importance: #MEDIUM, label: 'Company Code' }]
      @UI.identification: [{ position: 40 }]
      @UI.selectionField: [{ position: 20 }]
      CompanyCode,

      @UI.lineItem: [{ position: 50, importance: #MEDIUM, label: 'Valid From' }]
      @UI.identification: [{ position: 50 }]
      ValidFrom,

      @UI.lineItem: [{ position: 60, importance: #MEDIUM, label: 'Valid To' }]
      @UI.identification: [{ position: 60 }]
      ValidTo,

      @UI.lineItem: [{ position: 70, importance: #LOW, label: 'Active?' }]
      @UI.identification: [{ position: 70 }]
      IsActive,

      // administrative
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
