SELECT 
    COUNT(project_3.valueproperty.code_local_type) AS 'nombre_vente'
FROM
    project_3.valueproperty
        JOIN
    project_3.mutation ON project_3.mutation.mutation_id = project_3.valueproperty.mutation_id
WHERE
    (project_3.valueproperty.code_local_type = 2
        AND project_3.mutation.date_mutation BETWEEN DATE('2020-01-01') AND DATE('2020-06-30'))
GROUP BY 'nombre_vente'
;