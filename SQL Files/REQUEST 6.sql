WITH table_rate_of_change AS(
SELECT
(SELECT 
            COUNT(project_3.mutation.nature_mutation)
        FROM
            project_3.mutation
        WHERE
            project_3.mutation.date_mutation BETWEEN DATE('2020-01-01') AND DATE('2020-03-31')
		) 'first_quarter',
    (SELECT 
            COUNT(project_3.mutation.nature_mutation)
        FROM
            project_3.mutation
        WHERE
            project_3.mutation.date_mutation BETWEEN DATE('2020-04-01') AND DATE('2020-06-30')
		) 'second_quarter'
FROM
    project_3.mutation
)
SELECT
((second_quarter / first_quarter)-1)*100 as rate_of_change
FROM
table_rate_of_change
group by rate_of_change
;