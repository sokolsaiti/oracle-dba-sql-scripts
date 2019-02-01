SET LINESIZE 500
SET PAGESIZE 1000

COLUMN property_name FORMAT A35
COLUMN property_value FORMAT A35
COLUMN description FORMAT A70

select p.property_name,
       p.property_value,
       p.description 
from database_properties p;
