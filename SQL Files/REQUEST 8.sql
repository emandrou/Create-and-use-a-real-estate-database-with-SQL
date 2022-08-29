WITH table_percentage_difference AS (
SELECT 
(SELECT AVG(valeur_fonciere/surface_reel) 
FROM
project_3.valueproperty
JOIN
project_3.property ON project_3.valueproperty.property_id = project_3.property.property_id
JOIN
project_3.mutation ON project_3.valueproperty.mutation_id = project_3.mutation.mutation_id
WHERE
project_3.valueproperty.code_local_type = 2
AND project_3.property.n_pieces = 2) as 'price_per_m²_2pcs',
(SELECT AVG(valeur_fonciere/surface_reel) 
FROM
project_3.valueproperty
JOIN
project_3.property ON project_3.valueproperty.property_id = project_3.property.property_id
JOIN
project_3.mutation ON project_3.valueproperty.mutation_id = project_3.mutation.mutation_id
WHERE
project_3.valueproperty.code_local_type = 2
AND project_3.property.n_pieces = 3) as 'price_per_m²_3pcs'
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
)
SELECT
(((price_per_m²_2pcs - price_per_m²_3pcs)*100)/price_per_m²_2pcs) as 'percentage_difference_btw_2pcs_and_3pcs (2pcs appt 13.03% more expensive)'
FROM 
table_percentage_difference
group by 'percentage_difference_btw_2pcs_and_3pcs (2pcs appt 13.03% more expensive)'
;