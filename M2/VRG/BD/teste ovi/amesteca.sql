IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE NAME = 'amesteca'
		)
	DROP FUNCTION amesteca
GO
CREATE FUNCTION amesteca
(
    @cuvant varchar(max)
)
RETURNS varchar(max)
AS
BEGIN
DECLARE 
	@cuvant_nou varchar(max), @len_cuvant int, @len_a int, @cntr int, @Rand int,@prima varchar(1), @ultima varchar(1)


-- Excluse de la amesteca cuvinte formate doar din spatii sau cuvinte de o litera
if @cuvant=''
	return rtrim(@cuvant)
if LEN(@cuvant) in (1)
	return @cuvant
select 
	@prima=SUBSTRING(@cuvant,1,1), 
	@ultima=SUBSTRING(@cuvant,len(@cuvant),1),
	@cuvant=SUBSTRING(@cuvant,2,len(@cuvant)-2)

select 
	@cuvant_nou = '', @len_cuvant = LEN(@cuvant), @cntr = 1

WHILE @cntr <= @len_cuvant
    BEGIN
        select 
			@len_a = LEN(@cuvant);

        select
            @Rand = Convert(int,(((1) - @len_a) *  
                               random_nr + @len_a))
        FROM
            random_ovic
		
        select
			 @cuvant_nou = @cuvant_nou +SUBSTRING(@cuvant,@Rand,1)

		
		select 
			@cuvant= STUFF(@cuvant, CHARINDEX(SUBSTRING(@cuvant,@Rand,1), @cuvant), 1, '')
        select 
			@cntr = @cntr + 1;
    END

return @prima+@cuvant_nou+@ultima;
END
GO
 