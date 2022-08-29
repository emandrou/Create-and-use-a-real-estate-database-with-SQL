    WITH avg_valeur_fonciere AS(
    SELECT 
    project_3.valueproperty.nom_commune AS 'commune', 
    project_3.codeadresse.code_departement as 'department',
    sum(project_3.mutation.valeur_fonciere) as 'sum_value_ventes',
    count(*) as 'nombre_ventes',
	        RANK() OVER (
            PARTITION BY project_3.codeadresse.code_departement
            ORDER BY (sum(project_3.mutation.valeur_fonciere)/count(*)) DESC
        ) ranking_per_department
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
    where
    project_3.codeadresse.code_departement in (6, 13, 33, 59, 69)
    group by project_3.valueproperty.nom_commune
    order by project_3.codeadresse.code_departement asc
)
SELECT 
* ,
    (sum_value_ventes/nombre_ventes) as 'AVG_land_value'

    FROM 
    avg_valeur_fonciere
WHERE 
ranking_per_department <=3
 group by commune
;