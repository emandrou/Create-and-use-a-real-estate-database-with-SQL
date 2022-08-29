WITH liste_commune AS(
SELECT 
    project_3.commune.nom_commune,
    SUM(CASE
        WHEN project_3.mutation.date_mutation BETWEEN DATE('2020-01-01') AND DATE('2020-03-31') THEN 1
        ELSE 0
    END) AS 'first_quarter',
    SUM(CASE
        WHEN project_3.mutation.date_mutation BETWEEN DATE('2020-04-01') AND DATE('2020-06-30') THEN 1
        ELSE 0
    END) AS 'second_quarter'
FROM
    project_3.valueproperty
         JOIN
    project_3.mutation ON project_3.valueproperty.mutation_id = project_3.mutation.mutation_id
         JOIN
    project_3.commune ON project_3.valueproperty.nom_commune = project_3.commune.nom_commune
GROUP BY project_3.commune.nom_commune
)
SELECT 
    * 
FROM 
    liste_commune
WHERE 
 second_quarter > first_quarter
 and
 (second_quarter - first_quarter) >= (0.2 * (first_quarter))
;