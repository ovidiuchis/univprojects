GO
DECLARE @myDoc xml;       
SET @myDoc = '<Root>       
    <ProductDescription ProductID="1" ProductName="Road Bike">       
        <Features>       
        </Features>       
    </ProductDescription>       
</Root>'       ;
SELECT @myDoc       ;
-- insert first feature child (no need to specify as first or as last)       
SET @myDoc.modify('       
insert <Maintenance>3 year parts and labor extended maintenance is available</Maintenance> 
into (/Root/ProductDescription/Features)[1]') ;
SELECT @myDoc       ;
-- insert second feature. We want this to be the first in sequence so use 'as first'       
set @myDoc.modify('       
insert <Warranty>1 year parts and labor</Warranty>        
as first       
into (/Root/ProductDescription/Features)[1]       
')       ;
SELECT @myDoc       ;
-- insert third feature child. This one is the last child of <Features> so use 'as last'       
SELECT @myDoc       ;
SET @myDoc.modify('       
insert <Material>Aluminium</Material>        
as last       
into (/Root/ProductDescription/Features)[1]       
')       ;
SELECT @myDoc       ;
-- Add fourth feature - this time as a sibling (and not a child)       
-- 'after' keyword is used (instead of as first or as last child)       
SELECT @myDoc       ;
set @myDoc.modify('       
insert <BikeFrame>Strong long lasting</BikeFrame> 
after (/Root/ProductDescription/Features/Material)[1]       
')       ;
SELECT @myDoc;