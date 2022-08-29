SELECT 
    project_3.property.surface_reel,
    project_3.codeadresse.code_departement,
    project_3.mutation.valeur_fonciere AS max_appt_price
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
    project_3.valueproperty.code_local_type = 2
ORDER BY max_appt_price DESC
LIMIT 10
;