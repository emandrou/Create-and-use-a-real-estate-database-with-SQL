WITH AVG_max_appt_price AS (
SELECT 
project_3.codeadresse.code_departement AS 'departement',
SUM(project_3.property.surface_reel) as total_m²,    
SUM(project_3.mutation.valeur_fonciere) as total_price
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
    group by project_3.codeadresse.code_departement
)
SELECT
departement,
(total_price / total_m²) as max_appt_price
FROM
AVG_max_appt_price
GROUP BY departement
order by max_appt_price desc
limit 10
;