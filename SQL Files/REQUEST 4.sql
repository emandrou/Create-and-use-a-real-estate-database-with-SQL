SELECT 
    AVG(valeur_fonciere / surface_reel) 'avg_price_per_squaremetre_iledefrance'
FROM
    project_3.valueproperty
        JOIN
    project_3.property ON project_3.valueproperty.property_id = project_3.property.property_id
        JOIN
    project_3.mutation ON project_3.valueproperty.mutation_id = project_3.mutation.mutation_id
        JOIN
    project_3.commune ON project_3.valueproperty.nom_commune = project_3.commune.nom_commune
        JOIN
    project_3.codeadresse ON project_3.commune.code_postal = project_3.codeadresse.code_postal
WHERE
    project_3.valueproperty.code_local_type = 1
        AND project_3.codeadresse.code_departement IN (75, 77, 78, 91, 92, 93, 94, 95)
;