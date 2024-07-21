SELECT 
    table_schema,
    table_name,
    column_name,
    data_type,
    is_nullable,
    column_default,
    character_maximum_length
FROM 
    information_schema.columns
WHERE 
    table_schema NOT IN ('information_schema', 'pg_catalog')
ORDER BY 
    table_schema, 
    table_name, 
    ordinal_position;
