 SELECT 
    project_3.codeadresse.code_departement,
    MAX(valeur_fonciere / surface_reel) AS price_per_square
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
GROUP BY code_departement
ORDER BY price_per_square DESC
LIMIT 10
;