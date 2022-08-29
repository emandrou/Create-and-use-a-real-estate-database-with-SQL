WITH proportions_per_pcs AS (
SELECT 
    project_3.property.n_pieces as 'n_pcs',
     SUM(CASE
        WHEN project_3.valueproperty.code_local_type = 2 THEN 1
        ELSE 0 
    END) AS 'nombre_vente_per_pcs',
    (SELECT 
            COUNT(project_3.valueproperty.code_local_type)
        FROM
            project_3.valueproperty
            JOIN
    project_3.mutation ON project_3.mutation.mutation_id = project_3.valueproperty.mutation_id
        WHERE
            project_3.valueproperty.code_local_type = 2
) AS 'total_nombre_vente'
FROM
    project_3.valueproperty
JOIN
    project_3.property ON project_3.property.property_id = project_3.valueproperty.property_id
JOIN
    project_3.mutation ON project_3.mutation.mutation_id = project_3.valueproperty.mutation_id
GROUP BY n_pieces
ORDER BY n_pieces ASC
)
SELECT
n_pcs,
(nombre_vente_per_pcs / total_nombre_vente) *100 as proportions_per_pcs
FROM
    proportions_per_pcs
 ;